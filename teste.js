const fs = require('fs');
const { JSDOM } = require('jsdom');

const html = fs.readFileSync('index.html', 'utf8');
let falhas = 0;
const ok = (nome, cond) => { console.log((cond ? '  ok   ' : '  FALHA') + ' | ' + nome); if (!cond) falhas++; };

// Sessão 1: cadastro
let dom = new JSDOM(html, { runScripts: 'dangerously', url: 'https://exemplo.local/' });
let doc = dom.window.document;
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
const dom2 = new JSDOM(html, { runScripts: 'dangerously', url: 'https://exemplo.local/' });
dom2.window.localStorage.setItem('crm-perfumes:dados', salvo);
const dom3 = new JSDOM(html, { runScripts: 'dangerously', url: 'https://exemplo.local/' });
dom3.window.localStorage.setItem('crm-perfumes:dados', salvo);
// recarrega de fato: nova janela lendo o mesmo conteúdo
const dom4 = new JSDOM(html, { runScripts: 'outside-only', url: 'https://exemplo.local/' });
dom4.window.localStorage.setItem('crm-perfumes:dados', salvo);
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

console.log(falhas === 0 ? '\nTodos os testes passaram.' : '\n' + falhas + ' teste(s) falharam.');
process.exit(falhas ? 1 : 0);
