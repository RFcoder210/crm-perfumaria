const fs = require('fs');
const { JSDOM } = require('jsdom');

const html = fs.readFileSync('index.html', 'utf8');
let falhas = 0;
const ok = (nome, cond) => { console.log((cond ? '  ok   ' : '  FALHA') + ' | ' + nome); if (!cond) falhas++; };

// Sessão 1: cadastro
let dom = new JSDOM(html, { runScripts: 'dangerously', url: 'https://exemplo.local/' });
let doc = dom.window.document;
dom.window.scrollTo = () => {}; // o jsdom não tem rolagem de tela; evita ruído no console
const clicar = (d, sel) => d.querySelector(sel).dispatchEvent(new d.defaultView.Event('click', { bubbles: true }));

ok('a página desenha o cabeçalho', !!doc.querySelector('h1'));
ok('a aba de leads começa selecionada', doc.querySelector('.tab').getAttribute('aria-selected') === 'true');
ok('mostra estado vazio no primeiro acesso', !!doc.querySelector('.vazio'));

// cadastra um lead com acento e apóstrofo
doc.getElementById('l-nome').value = "Márcia D'Ávila";
clicar(doc, '[data-acao="add-lead"]');
ok('cadastra lead só com o nome', doc.querySelectorAll('.card').length === 1);
ok('preserva acento e apóstrofo', doc.querySelector('.nome').textContent === "Márcia D'Ávila");

// marca duas etapas fora de ordem (pulando a primeira)
const pontos = doc.querySelectorAll('.dot');
pontos[3].dispatchEvent(new dom.window.Event('click', { bubbles: true })); // pagou
ok('permite marcar etapa fora de ordem', doc.querySelectorAll('.dot[aria-pressed="true"]').length === 1);
doc.querySelectorAll('.dot')[3].dispatchEvent(new dom.window.Event('click', { bubbles: true }));
ok('permite desmarcar a mesma etapa', doc.querySelectorAll('.dot[aria-pressed="true"]').length === 0);

// marca entregue -> deve surgir o botão de lançar em vendas
doc.querySelectorAll('.dot')[4].dispatchEvent(new dom.window.Event('click', { bubbles: true }));
ok('oferece lançar em vendas após entregue', !!doc.querySelector('[data-acao="converter"]'));
clicar(doc, '[data-acao="converter"]');
ok('botão de lançar some após o uso', !doc.querySelector('[data-acao="converter"]'));
ok('marca o selo de venda registrada', !!doc.querySelector('.selo'));

const salvo = dom.window.localStorage.getItem('crm-perfumes:dados');
ok('gravou no armazenamento do navegador', !!salvo);
ok('a venda foi criada', JSON.parse(salvo).vendas.length === 1);

// Sessão 2: recarregar a página com o mesmo armazenamento
// recarrega de fato: nova janela lendo o mesmo conteúdo
const dom5 = new JSDOM(html, {
  runScripts: 'dangerously',
  url: 'https://exemplo.local/',
  beforeParse(w) { w.localStorage.setItem('crm-perfumes:dados', salvo); }
});
const doc5 = dom5.window.document;
ok('os dados voltam após recarregar', doc5.querySelectorAll('.card').length === 1);
ok('a etapa marcada continua marcada', doc5.querySelectorAll('.dot[aria-pressed="true"]').length === 1);

// busca sem resultado
const busca = doc5.getElementById('busca');
busca.value = 'zzzz';
busca.dispatchEvent(new dom5.window.Event('input', { bubbles: true }));
ok('busca sem resultado mostra aviso', !!doc5.querySelector('.vazio'));

// dados corrompidos não são sobrescritos
const dom6 = new JSDOM(html, {
  runScripts: 'dangerously',
  url: 'https://exemplo.local/',
  beforeParse(w) { w.localStorage.setItem('crm-perfumes:dados', '{quebrado'); }
});
ok('avisa quando os dados estão ilegíveis', !!dom6.window.document.querySelector('.aviso'));
ok('não apaga dados ilegíveis', dom6.window.localStorage.getItem('crm-perfumes:dados') === '{quebrado');

// Sessão 3: busca (continua na primeira página, que já tem a Márcia cadastrada)
doc.getElementById('l-nome').value = 'Ana Telefone';
doc.getElementById('l-tel').value = '61 97777-6666';
clicar(doc, '[data-acao="add-lead"]');

const buscar = (termo) => {
  const campo = doc.getElementById('busca');
  campo.value = termo;
  campo.dispatchEvent(new dom.window.Event('input', { bubbles: true }));
  return [...doc.querySelectorAll('.nome')].map(n => n.textContent);
};

ok('busca acha nome digitado sem acento', buscar('marcia').includes("Márcia D'Ávila"));
ok('busca acha telefone digitado sem pontuação', buscar('977776666').includes('Ana Telefone'));
ok('busca acha telefone como está escrito', buscar('97777-6666').includes('Ana Telefone'));
ok('busca por termo inexistente não traz ninguém', buscar('zzzz').length === 0);
buscar('');

// Sessão 4: o que está digitado não se perde quando a tela é redesenhada
clicar(doc, '[data-acao="editar-lead"]');
doc.getElementById('l-obs').value = 'rascunho ainda não salvo';
doc.querySelectorAll('.dot')[0].dispatchEvent(new dom.window.Event('click', { bubbles: true }));
ok('mantém o texto digitado ao marcar etapa durante a edição',
  doc.getElementById('l-obs').value === 'rascunho ainda não salvo');

buscar('ana');
ok('mantém o texto digitado ao usar a busca durante a edição',
  doc.getElementById('l-obs').value === 'rascunho ainda não salvo');
buscar('');

clicar(doc, '[data-acao="cancelar"]');
ok('formulário volta limpo depois de cancelar', doc.getElementById('l-obs').value === '');

doc.getElementById('l-nome').value = 'Teste Limpeza';
clicar(doc, '[data-acao="add-lead"]');
ok('limpa o formulário depois de adicionar', doc.getElementById('l-nome').value === '');

// Sessão 5: tabela de vendas
clicar(doc, '[data-acao="aba"][data-aba="vendas"]');
ok('mostra traço quando a venda não tem perfume',
  doc.querySelector('tbody tr td:nth-child(2)').textContent === '—');

// Sessão 6: exportação (captura o texto que seria baixado como CSV)
let partesCsv = null;
dom.window.Blob = class { constructor(partes) { partesCsv = partes; } };
dom.window.URL.createObjectURL = () => 'blob:teste';
dom.window.URL.revokeObjectURL = () => {};
dom.window.HTMLAnchorElement.prototype.click = () => {}; // o jsdom não baixa arquivos
ok('o botão Exportar CSV existe', !!doc.querySelector('[data-acao="csv"]'));
clicar(doc, '[data-acao="csv"]');
const csv = partesCsv ? partesCsv.join('') : '';
const linhasCsv = csv.replace(/^﻿/, '').split('\n'); // sem o BOM, para achar a linha LEADS
const iLeads = linhasCsv.indexOf('LEADS');
const iVendas = linhasCsv.indexOf('VENDAS');
ok('o CSV começa com a marca UTF-8 (BOM) para o Excel', csv.startsWith('﻿'));
ok('o CSV tem a seção LEADS', iLeads !== -1);
ok('o CSV tem a seção VENDAS', iVendas !== -1);
ok('o CSV preserva acento e apóstrofo', csv.includes("Márcia D'Ávila"));
ok('o CSV usa ponto e vírgula como separador', linhasCsv[iLeads + 1].split('";"').length > 5);
ok('o cabeçalho de leads contém Observação', linhasCsv[iLeads + 1].includes('Observação'));
const dadosLeads = linhasCsv.slice(iLeads + 2, iVendas).filter(l => l.trim() !== '');
ok('a seção LEADS tem 3 linhas de dados', dadosLeads.length === 3);

// Sessão 7: aviso de cópia de segurança
// Abre a página fingindo que hoje é "dia" (AAAA-MM-DD, ao meio-dia, hora local)
// e com o armazenamento já preenchido.
const paginaEm = (dia, dados, backup) => {
  const agora = new Date(dia + 'T12:00:00').getTime();
  return new JSDOM(html, {
    runScripts: 'dangerously',
    url: 'https://exemplo.local/',
    beforeParse(w) {
      const DateReal = w.Date;
      w.Date = class extends DateReal {
        constructor(...a) { if (a.length) super(...a); else super(agora); }
        static now() { return agora; }
      };
      w.scrollTo = () => {};
      if (dados !== undefined) w.localStorage.setItem('crm-perfumes:dados', JSON.stringify(dados));
      if (backup !== undefined) w.localStorage.setItem('crm-perfumes:backup', typeof backup === 'string' ? backup : JSON.stringify(backup));
    }
  });
};
const umLead = { leads: [{ id: 'a1', nome: 'Ana', telefone: '', perfume: '', familia: '', data: '2026-09-01', obs: '',
  etapas: { msg1: false, msg2: false, encomenda: false, pago: false, entregue: false, recompra: false }, convertido: false }], vendas: [] };
const temAviso = (d) => !!d.window.document.querySelector('.aviso-backup');

let p = paginaEm('2026-09-20', umLead, { ultimo: '2026-09-12', primeiro: '2026-09-01' });
ok('avisa quando a última exportação tem 8 dias', temAviso(p));
ok('o aviso diz quantos dias faz', p.window.document.querySelector('.aviso-backup').textContent.includes('Faz 8 dias'));

p = paginaEm('2026-09-20', umLead, { ultimo: '2026-09-18', primeiro: '2026-09-01' });
ok('não avisa com exportação recente no mesmo mês', !temAviso(p));

p = paginaEm('2026-10-01', umLead, { ultimo: '2026-09-29', primeiro: '2026-09-01' });
ok('avisa na virada do mês mesmo com exportação de 2 dias', temAviso(p));
ok('o aviso da virada cita o mês anterior',
  p.window.document.querySelector('.aviso-backup').textContent.includes('Outubro começou. Quer guardar uma cópia dos dados de setembro?'));

p = paginaEm('2026-01-05', umLead, { ultimo: '2025-12-31', primeiro: '2025-12-01' });
ok('na virada de ano o mês anterior é dezembro',
  p.window.document.querySelector('.aviso-backup').textContent.includes('dados de dezembro'));

p = paginaEm('2026-09-30', { leads: [], vendas: [] }, { ultimo: '2026-08-01', primeiro: '2026-08-01' });
ok('não avisa com a lista vazia', !temAviso(p));

p = paginaEm('2026-09-20', umLead, { ultimo: '2026-09-01', primeiro: '2026-09-01' });
ok('o aviso aparece antes de exportar', temAviso(p));
p.window.Blob = class {};
p.window.URL.createObjectURL = () => 'blob:teste';
p.window.URL.revokeObjectURL = () => {};
p.window.HTMLAnchorElement.prototype.click = () => {};
clicar(p.window.document, '.aviso-backup [data-acao="csv"]');
ok('o aviso some ao exportar', !temAviso(p));
ok('grava a data de hoje como última exportação',
  JSON.parse(p.window.localStorage.getItem('crm-perfumes:backup')).ultimo === '2026-09-20');

p = paginaEm('2026-09-20', umLead); // nunca exportou; sem chave de backup: o primeiro uso é hoje
ok('nunca exportou e primeiro uso recente: sem aviso', !temAviso(p));
ok('anota o dia do primeiro uso',
  JSON.parse(p.window.localStorage.getItem('crm-perfumes:backup')).primeiro === '2026-09-20');

p = paginaEm('2026-09-20', umLead, { ultimo: '', primeiro: '2026-09-10' });
ok('nunca exportou e primeiro uso há 10 dias: avisa', temAviso(p));

p = paginaEm('2026-09-20', undefined, undefined);
p.window.document.getElementById('l-nome').value = 'Primeira';
clicar(p.window.document, '[data-acao="add-lead"]');
ok('o primeiro cadastro não dispara o aviso', !temAviso(p));
ok('o primeiro cadastro grava o dia do primeiro uso',
  JSON.parse(p.window.localStorage.getItem('crm-perfumes:backup')).primeiro === '2026-09-20');

p = paginaEm('2026-09-20', umLead, '{quebrado');
ok('chave de backup corrompida não quebra a página', p.window.document.querySelectorAll('.card').length === 1);
ok('chave de backup corrompida: sem aviso e sem erro na tela', !temAviso(p) && !p.window.document.querySelector('.aviso'));
ok('chave de backup corrompida não é sobrescrita ao cadastrar', (() => {
  p.window.document.getElementById('l-nome').value = 'Outra';
  clicar(p.window.document, '[data-acao="add-lead"]');
  return p.window.localStorage.getItem('crm-perfumes:backup') === '{quebrado' && p.window.document.querySelectorAll('.card').length === 2;
})());

// armazenamento bloqueado: o sistema abre e não mostra aviso de cópia
const bloq = new JSDOM(html, {
  runScripts: 'dangerously',
  url: 'https://exemplo.local/',
  beforeParse(w) {
    Object.defineProperty(w, 'localStorage', { get() { throw new Error('bloqueado'); } });
  }
});
ok('armazenamento bloqueado: a página abre sem aviso de cópia',
  !!bloq.window.document.querySelector('h1') && !bloq.window.document.querySelector('.aviso-backup'));

console.log(falhas === 0 ? '\nTodos os testes passaram.' : '\n' + falhas + ' teste(s) falharam.');
process.exit(falhas ? 1 : 0);
