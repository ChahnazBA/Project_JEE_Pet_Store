<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inscription</title>
    <style>
        /* Styles globaux */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Conteneur du formulaire */
        form {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #1a73e8;
            margin-bottom: 30px;
            font-weight: 500;
        }

        /* Champs de saisie */
        div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #5f6368;
            font-size: 0.9rem;
            font-weight: 600;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #dadce0;
            border-radius: 6px;
            font-size: 1rem;
            box-sizing: border-box; /* Important pour garder la largeur correcte */
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-color: #1a73e8;
            box-shadow: 0 0 0 2px rgba(26,115,232,0.2);
        }

        /* Section Radio boutons */
        p {
            font-weight: 600;
            color: #3c4043;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            align-items: center;
            margin-bottom: 25px;
        }

        input[type="radio"] {
            margin-right: 5px;
            cursor: pointer;
        }

        /* Bouton Soumettre */
        button {
            width: 100%;
            padding: 12px;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s, transform 0.1s;
            margin-top: 10px;
        }

        button:hover {
            background-color: #1557b0;
        }

        button:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>
<form action="InscriptionServlet" method="post">
    <h2 style="margin-top: 0;">Créer un compte</h2>

    <div>
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" placeholder="Votre nom" required>
    </div>

    <div>
        <label for="email">Email :</label>
        <input type="email" id="email" name="email" placeholder="exemple@mail.com" required>
    </div>

    <p>Vous êtes un :</p>
    <div class="radio-group">
         <span>
             <input type="radio" id="role_Ach" name="role" value="Acheteur" checked>
             <label for="role_Ach" style="display:inline; font-weight: normal;">Acheteur</label>
         </span>

        <span>
             <input type="radio" id="role_Ven" name="role" value="Vendeur">
             <label for="role_Ven" style="display:inline; font-weight: normal;">Vendeur</label>
         </span>
    </div>

    <button type="submit">S'inscrire</button>
</form>
</body>
</html>