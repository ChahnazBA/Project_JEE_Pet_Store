<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Détails de la Commande</title>
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

    /* Carte de la facture */
    .invoice-card {
      background: white;
      max-width: 700px;
      width: 100%;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      overflow: hidden;
    }

    .header {
      background-color: #455a64; /* Gris bleu professionnel */
      color: white;
      padding: 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .header h2 { margin: 0; font-size: 1.4rem; }

    .badge-success {
      background: #c8e6c9;
      color: #2e7d32;
      padding: 6px 12px;
      border-radius: 20px;
      font-weight: bold;
      font-size: 0.8rem;
      border: 1px solid #a5d6a7;
    }

    .content { padding: 40px; }

    .info-section {
      margin-bottom: 30px;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }

    h3 {
      color: #455a64;
      font-size: 1.1rem;
      margin-bottom: 15px;
      border-bottom: 2px solid #eee;
      padding-bottom: 10px;
    }

    p { margin: 8px 0; font-size: 0.95rem; }

    strong { color: #555; }

    /* Table de récapitulatif */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th {
      background: #f8f9fa;
      padding: 12px;
      text-align: left;
      font-size: 0.85rem;
      color: #777;
      text-transform: uppercase;
    }

    td {
      padding: 15px 12px;
      border-bottom: 1px solid #eee;
    }

    .total-row td {
      font-size: 1.2rem;
      font-weight: bold;
      color: #2e7d32;
      border-bottom: none;
    }

    /* Footer & Boutons */
    .footer {
      padding: 30px;
      background: #fdfdfd;
      border-top: 1px solid #eee;
      text-align: center;
    }

    .footer p {
      color: #888;
      font-style: italic;
      margin-bottom: 20px;
      font-size: 0.9rem;
    }

    .btn-print {
      background-color: #2196F3;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-weight: 600;
      transition: background 0.3s;
    }

    .btn-print:hover { background-color: #1976D2; }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      text-decoration: none;
      color: #666;
      font-size: 0.9rem;
    }

    /* Cache le bouton et le lien lors de l'impression réelle */
    @media print {
      body { background: white; }
      .invoice-card { box-shadow: none; border: 1px solid #eee; }
      .btn-print, .back-link { display: none; }
    }
  </style>
</head>
<body>
<div class="invoice-card">
  <div class="header">
    <h2>📄 Facture d'adoption</h2>
    <span class="badge-success">CONFIRMÉE</span>
  </div>

  <div class="content">
    <div class="info-section">
      <div>
        <p><strong>N° de commande :</strong></p>
        <p style="font-family: monospace; font-size: 1.1rem;">#ORD-${commande.id}</p>
      </div>
      <div style="text-align: right;">
        <p><strong>Adopté par :</strong> ${commande.user.nom}</p>
        <p><strong>Contact :</strong> ${commande.user.email}</p>
      </div>
    </div>

    <h3>Récapitulatif de l'animal</h3>
    <table>
      <thead>
      <tr>
        <th>Description</th>
        <th style="text-align: right;">Total</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>Adoption de <strong>${commande.pet.race}</strong></td>
        <td style="text-align: right;">${commande.pet.price} €</td>
      </tr>
      <tr class="total-row">
        <td style="text-align: right;">TOTAL :</td>
        <td style="text-align: right;">${commande.pet.price} €</td>
      </tr>
      </tbody>
    </table>
  </div>

  <div class="footer">
    <p>Merci d'avoir utilisé notre plateforme pour trouver un nouveau foyer !</p>
    <button onclick="window.print()" class="btn-print">🖨️ Imprimer le reçu</button>
  </div>
</div>

<div style="width: 100%; position: absolute; bottom: 20px; left: 0;">
  <a href="tableau-bord.jsp" class="back-link">← Retour au tableau de bord</a>
</div>

</body>
</html>