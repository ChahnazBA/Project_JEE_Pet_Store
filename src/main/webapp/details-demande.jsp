<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Détails de la Demande</title>
  <style>
    /* Styles Globaux */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f0f2f5;
      color: #333;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }

    /* Carte principale */
    .container {
      background: white;
      max-width: 600px;
      width: 100%;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      overflow: hidden;
      padding: 0;
    }

    .header {
      background-color: #2196F3;
      color: white;
      padding: 20px;
      text-align: center;
    }

    .header h2 {
      margin: 0;
      font-size: 1.5rem;
    }

    .content {
      padding: 30px;
    }

    h3 {
      color: #1a73e8;
      border-left: 4px solid #1a73e8;
      padding-left: 10px;
      margin-top: 0;
      font-size: 1.1rem;
    }

    p {
      font-size: 1rem;
      margin: 10px 0;
    }

    strong {
      color: #555;
      width: 100px;
      display: inline-block;
    }

    hr {
      border: 0;
      height: 1px;
      background: #eee;
      margin: 25px 0;
    }

    /* Actions & Boutons */
    .actions {
      background: #f8f9fa;
      padding: 20px 30px;
      border-top: 1px solid #eee;
      display: flex;
      gap: 15px;
    }

    .btn {
      flex: 1;
      padding: 12px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
      font-size: 0.95rem;
      transition: opacity 0.2s, transform 0.1s;
    }

    .btn-accept {
      background: #4CAF50;
      color: white;
    }

    .btn-refuse {
      background: #f44336;
      color: white;
    }

    .btn:hover {
      opacity: 0.9;
    }

    .btn:active {
      transform: scale(0.98);
    }

    /* Lien retour */
    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      text-decoration: none;
      color: #666;
      font-size: 0.9rem;
    }

    .back-link:hover {
      color: #2196F3;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h2>📩 Demande d'adoption reçue</h2>
  </div>

  <div class="content">
    <div>
      <h3>Informations sur l'acheteur</h3>
      <p><strong>Nom :</strong> ${commande.user.nom}</p>
      <p><strong>Email :</strong> ${commande.user.email}</p>

      <hr>

      <h3>Détails de l'animal</h3>
      <p><strong>Race :</strong> ${commande.pet.race}</p>
      <p><strong>Âge :</strong> ${commande.pet.age} mois</p>
      <p><strong>Prix :</strong> ${commande.pet.price} €</p>
    </div>
  </div>

  <div class="actions">
    <form action="AdoptionServlet" method="post" style="display: flex; gap: 15px; width: 100%; margin: 0;">
      <input type="hidden" name="cmdId" value="${commande.id}">

      <button type="submit" name="decision" value="valider" class="btn btn-accept">
        Accepter l'adoption
      </button>

      <button type="submit" name="decision" value="refuser" class="btn btn-refuse"
              onclick="return confirm('Êtes-vous sûr de vouloir refuser cette demande ?');">
        Refuser la demande
      </button>
    </form>
  </div>

  <div style="padding-bottom: 20px;">
    <a href="tableau-bord.jsp" class="back-link">← Retour au tableau de bord</a>
  </div>
</div>
</body>
</html>