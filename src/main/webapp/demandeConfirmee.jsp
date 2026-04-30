<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Demande envoyée</title>
  <style>
    /* Styles Globaux */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f7f6;
      color: #333;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    /* Conteneur principal */
    .success-container {
      background: white;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      max-width: 500px;
      width: 90%;
      text-align: center;
    }

    .icon-box {
      font-size: 50px;
      margin-bottom: 10px;
      color: #2196F3;
    }

    h1 {
      color: #2c3e50;
      margin-bottom: 15px;
      font-size: 1.8rem;
    }

    .status-badge {
      display: inline-block;
      background-color: #fff3e0;
      color: #ef6c00;
      padding: 8px 20px;
      border-radius: 20px;
      font-weight: bold;
      font-size: 0.85em;
      border: 1px solid #ffe0b2;
      margin-bottom: 20px;
    }

    .info-card {
      background-color: #f8f9fa;
      border-left: 5px solid #2196F3;
      padding: 20px;
      margin: 25px 0;
      text-align: left;
      border-radius: 4px;
    }

    .info-card p {
      margin: 8px 0;
      font-size: 0.95rem;
    }

    .info-card strong {
      color: #546e7a;
      width: 150px;
      display: inline-block;
    }

    .btn-home {
      display: inline-block;
      background-color: #2196F3;
      color: white;
      padding: 14px 30px;
      text-decoration: none;
      border-radius: 8px;
      font-weight: 600;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(33, 150, 243, 0.2);
    }

    .btn-home:hover {
      background-color: #1976D2;
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(33, 150, 243, 0.3);
    }

    .btn-home:active {
      transform: translateY(0);
    }
  </style>
</head>
<body>

<div class="success-container">
  <div class="icon-box">✉️</div>
  <h1>Demande transmise !</h1>
  <span class="status-badge">En attente de validation par le vendeur</span>

  <p style="color: #666; margin-top: 10px; line-height: 1.5;">
    Merci <strong>${user.nom}</strong>.<br>
    Votre intérêt pour cet animal a été notifié au propriétaire.
  </p>

  <div class="info-card">
    <p><strong>Référence :</strong> #${maDemande.id}</p>
    <p><strong>Animal :</strong> ${maDemande.pet.race}</p>
    <p><strong>Âge :</strong> ${maDemande.pet.age} mois</p>
    <p><strong>Prix proposé :</strong> ${maDemande.pet.price} €</p>
  </div>

  <p style="font-size: 0.85em; color: #888; margin-bottom: 30px;">
    Dès que le vendeur aura examiné votre profil, vous recevrez une confirmation
    pour finaliser l'adoption.
  </p>

  <div>
    <a href="PetServlet" class="btn-home">Retour au catalogue</a>
  </div>
</div>

</body>
</html>