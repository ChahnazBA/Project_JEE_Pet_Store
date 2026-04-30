<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Mettre un animal en vente</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f0f2f5;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }

    .form-container {
      background: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 500px;
    }

    h2 {
      color: #1a73e8;
      margin-top: 0;
      margin-bottom: 10px;
      text-align: center;
    }

    p.subtitle {
      text-align: center;
      color: #666;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #444;
    }

    input[type="text"],
    input[type="number"],
    select {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 6px;
      box-sizing: border-box;
      font-size: 1rem;
    }

    input:focus, select:focus {
      outline: none;
      border-color: #1a73e8;
      box-shadow: 0 0 0 2px rgba(26,115,232,0.1);
    }

    .btn-submit {
      width: 100%;
      padding: 14px;
      background-color: #2196F3;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 1rem;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.3s;
      margin-top: 10px;
    }

    .btn-submit:hover {
      background-color: #1976D2;
    }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      text-decoration: none;
      color: #666;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Nouvelle Annonce</h2>
  <p class="subtitle">Remplissez les informations du pet.</p>

  <form method="post" action="PetServlet">
    <%-- On récupère le nom du vendeur depuis la session --%>
    <input type="hidden" name="nomVendeur" value="${user.nom}">

    <div class="form-group">
      <label for="race">Race de l'animal :</label>
      <input type="text" id="race" name="race" placeholder="Ex: Berger Allemand, Maine Coon..." required>
    </div>

    <div class="form-group">
      <label for="sexe">Sexe :</label>
      <select id="sexe" name="sexe">
        <option value="Mâle">Mâle</option>
        <option value="Femelle">Femelle</option>
      </select>
    </div>

    <div class="form-group">
      <label for="age">Âge (en mois) :</label>
      <input type="number" id="age" name="age" min="0" placeholder="0" required>
    </div>

    <div class="form-group">
      <label for="price">Prix de vente (€) :</label>
      <input type="number" id="price" name="price" step="0.01" min="0" placeholder="0.00" required>
    </div>

    <button type="submit" class="btn-submit">🚀 Publier l'annonce</button>
  </form>

  <a href="tableau-bord.jsp" class="back-link">← Annuler et retourner au tableau de bord</a>
</div>

</body>
</html>