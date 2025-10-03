
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Ótica Nordestina - Exu-PE</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: linear-gradient(#b30059, #ffb6c1); /* Rosa escuro para rosa claro */
      color: white;
    }

    header, footer {
      background-color: #b30059;
      padding: 20px;
      text-align: center;
    }

    .container {
      padding: 20px;
    }

    .social-buttons a {
      margin: 10px;
      text-decoration: none;
      font-size: 24px;
      color: white;
    }

    .email-form input, .email-form button {
      padding: 10px;
      font-size: 16px;
      margin: 5px;
    }

    .chat-box {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #b30059;
      padding: 15px;
      border-radius: 10px;
      width: 300px;
    }

    .chat-box textarea {
      width: 100%;
      height: 60px;
      resize: none;
    }

    .chat-box button {
      margin-top: 5px;
      width: 100%;
      padding: 8px;
    }

    .announcement {
      background-color: #ff69b4;
      padding: 20px;
      margin-top: 20px;
      border-radius: 10px;
    }

    iframe {
      width: 100%;
      border: none;
      margin-top: 20px;
    }

    .audio-recorder {
      margin-top: 10px;
    }
  </style>
</head>
<body>

  <header>
    <h1>Ótica Nordestina - Centro de Exu-PE</h1>
  </header>

  <div class="container">
    <!-- Redes Sociais -->
    <div class="social-buttons">
      <a href="https://facebook.com" target="_blank">📘 Facebook</a>
      <a href="https://instagram.com" target="_blank">📸 Instagram</a>
      <a href="https://wa.me/5587998205648" target="_blank">📱 WhatsApp</a>
      <a href="https://tiktok.com" target="_blank">🎵 TikTok</a>
      <a href="https://kwai.com" target="_blank">📷 Kwai</a>
      <a href="https://youtube.com" target="_blank">📺 YouTube</a>
      <a href="https://twitter.com" target="_blank">🐦 Twitter</a>
      <a href="https://telegram.me" target="_blank">✈️ Telegram</a>
    </div>

    <!-- Cadastro de E-mail -->
    <div class="email-form">
      <h2>Cadastre seu E-mail</h2>
      <input type="email" placeholder="Seu e-mail">
      <button>Enviar</button>
    </div>

    <!-- Anúncio -->
    <div class="announcement">
      <h2>Modelos e Preços de Óculos</h2>
      <ul>
        <li>Óculos de Grau - a partir de R$ 99,00</li>
        <li>Óculos de Sol - a partir de R$ 79,00</li>
        <li>Armações modernas e resistentes</li>
        <li>Lentes antirreflexo, blue light, fotossensíveis</li>
      </ul>
    </div>

    <!-- Google Maps -->
    <h2>Estamos aqui:</h2>
    <iframe 
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3949.793325947919!2d-39.724657!3d-7.503378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7a247d4b3b682ff%3A0xf71b69c8c84e5f74!2sCentro%2C%20Exu%20-%20PE!5e0!3m2!1spt-BR!2sbr!4v1600000000000"
      height="300"
      allowfullscreen=""
      loading="lazy">
    </iframe>

    <!-- Google Tradutor -->
    <div id="google_translate_element"></div>

  </div>

  <!-- Chat de Atendimento com Gravador -->
  <div class="chat-box">
    <h3>Atendimento Online</h3>
    <textarea placeholder="Digite sua mensagem..."></textarea>
    <button>Enviar</button>

    <!-- Gravador de Áudio -->
    <div class="audio-recorder">
      <button onclick="startRecording()">🎙️ Gravar Áudio</button>
      <audio id="audioPlayer" controls style="display:none;"></audio>
    </div>
  </div>

  <footer>
    <p>&copy; 2025 Ótica Nordestina - Exu-PE. Todos os direitos reservados.</p>
  </footer>

  <!-- Google Tradutor Script -->
  <script type="text/javascript">
    function googleTranslateElementInit() {
      new google.translate.TranslateElement({pageLanguage: 'pt'}, 'google_translate_element');
    }
  </script>
  <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

  <!-- Gravador de Áudio -->
  <script>
    let mediaRecorder;
    let audioChunks = [];

    async function startRecording() {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      mediaRecorder = new MediaRecorder(stream);

      mediaRecorder.start();

      mediaRecorder.ondataavailable = function(e) {
        audioChunks.push(e.data);
      };

      mediaRecorder.onstop = function() {
        const audioBlob = new Blob(audioChunks, { type: 'audio/wav' });
        const audioUrl = URL.createObjectURL(audioBlob);
        const audioPlayer = document.getElementById('audioPlayer');
        audioPlayer.src = audioUrl;
        audioPlayer.style.display = 'block';
        audioPlayer.play();
        audioChunks = [];
      };

      setTimeout(() => {
        mediaRecorder.stop();
      }, 5000); // Grava por 5 segundos
    }
  </script>

</body>
</html>
