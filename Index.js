// Evento ao enviar o formulário de contato
document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('form-contato');

  if (form) {
    form.addEventListener('submit', (event) => {
      event.preventDefault();

      const nome = document.getElementById('nome').value.trim();
      const email = document.getElementById('email').value.trim();
      const mensagem = document.getElementById('mensagem').value.trim();

      if (!nome || !email || !mensagem) {
        alert('Por favor, preencha todos os campos.');
        return;
      }

      // Aqui você pode integrar com um serviço de backend ou email
      alert('Mensagem enviada com sucesso!');
      form.reset();
    });
  }

  // Botão voltar ao topo
  const btnTopo = document.createElement('button');
  btnTopo.innerText = '⬆️';
  btnTopo.id = 'btn-topo';
  btnTopo.style.position = 'fixed';
  btnTopo.style.bottom = '20px';
  btnTopo.style.right = '20px';
  btnTopo.style.display = 'none';
  btnTopo.style.padding = '10px';
  btnTopo.style.border = 'none';
  btnTopo.style.borderRadius = '50%';
  btnTopo.style.backgroundColor = '#004466';
  btnTopo.style.color = 'white';
  btnTopo.style.cursor = 'pointer';
  btnTopo.title = 'Voltar ao topo';

  document.body.appendChild(btnTopo);

  btnTopo.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });

  // Mostrar botão ao rolar
  window.addEventListener('scroll', () => {
    if (window.scrollY > 300) {
      btnTopo.style.display = 'block';
    } else {
      btnTopo.style.display = 'none';
    }
  });
});
