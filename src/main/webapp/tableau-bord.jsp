<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Welcome</title>
    <style>
        /* Styles Globaux */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 40px;
        }

        h2 {
            color: #2c3e50;
            border-bottom: 2px solid #2196F3;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }

        h3 { margin-top: 0; color: #444; }

        /* Conteneurs de Tableaux de Bord */
        .dashboard-container {
            background: white;
            padding: 25px;
            border-radius: 12px !important; /* Force l'arrondi sur vos styles inline */
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        /* Tableaux */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
            border: none !important;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        th {
            background-color: #f8f9fa;
            color: #555;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 15px;
            border-bottom: 2px solid #eee;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }

        tr:hover {
            background-color: #fcfcfc;
        }

        /* Formulaires & Inputs */
        input[type="text"],
        input[type="number"],
        select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-top: 5px;
            transition: border-color 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #2196F3;
        }

        /* Boutons (Amélioration des styles inline existants) */
        button {
            transition: transform 0.2s, opacity 0.2s;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        button:hover {
            opacity: 0.9;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        /* Badges de statut */
        span[style*="color"] {
            font-weight: bold;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.85em;
            background: #f0f0f0;
        }

        hr {
            border: 0;
            height: 1px;
            background: #eee;
            margin: 30px 0;
        }
    </style>
</head>
<body>
<jsp:useBean id="user" class="Model.User" scope="session" />
<h2>Bienvenue, <c:out value="${user.nom}" /></h2>

<c:choose>
    <%-- Cas de l'Acheteur --%>
    <c:when test="${user.role == 'Acheteur'}">
        <div class="dashboard-container" style="border: 2px solid green; padding: 10px;">
            <h3>Tableau de bord Acheteur</h3>
        </div>
        <form action="PetServlet" method="get">
            <button type="submit" style="background-color: #4CAF50; color: white; padding: 10px; border: none; cursor: pointer; border-radius: 6px;">
                🐾 Un nouveau membre de la famille?
            </button>
        </form>

        <hr>

        <h4>Consultez vos futurs animaux de compagnie !!</h4>
        <c:choose>
            <c:when test="${not empty catalogue}">
                <table border="1" style="width:100%; border-collapse: collapse;">
                    <thead style="background-color: #e8f5e9;">
                    <tr>
                        <th>Race</th>
                        <th>Sexe</th>
                        <th>Âge</th>
                        <th>Prix</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${catalogue}" var="pet">
                        <tr style="${pet.status== 2 ? 'background-color: #f9f9f9; opacity: 0.7;' : ''}">
                            <td><c:out value="${pet.race}" /></td>
                            <td><c:out value="${pet.sexe}" /></td>
                            <td><c:out value="${pet.age}" /> mois</td>
                            <td><c:out value="${pet.price}" /> €</td>
                            <td>
                                <c:if test="${pet.status == 0}">
                                    <form action="DemandeServlet" method="post" style="margin:0;">
                                        <input type="hidden" name="petId" value="${pet.id}">
                                        <input type="hidden" name="nomAcheteur" value="${user.nom}">
                                        <button type="submit" style="background-color: #4CAF50; color: white; border: none; padding: 8px 15px; cursor: pointer; border-radius: 4px;">
                                            Envoyer une demande
                                        </button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>Aucun animal disponible.</p>
            </c:otherwise>
        </c:choose>
    </c:when>

    <%-- Cas du Vendeur --%>
    <c:when test="${user.role == 'Vendeur'}">
        <div class="dashboard-container" style="border: 2px solid blue; padding: 20px; border-radius: 8px;">
            <h3>Tableau de bord Vendeur</h3>
            <div style="text-align: right; margin-bottom: 20px;">
                <a href="ajouter-animal.jsp" style="text-decoration: none; background: #2196F3; color: white; padding: 10px 20px; border-radius: 5px; font-weight: bold;">
                    + Ajouter un animal
                </a>
            </div>

            <hr>

            <h3>Vos Animaux en vente</h3>

            <table border="1" style="width:100%; border-collapse: collapse; text-align: left;">
                <thead style="background-color: #f2f2f2;">
                <tr>
                    <th>Race</th>
                    <th>Sexe</th>
                    <th>Âge</th>
                    <th>Prix (€)</th>
                    <th>Statut</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${user.pets}" var="p">
                    <tr>
                        <td><strong><c:out value="${p.race}" /></strong></td>
                        <td><c:out value="${p.sexe}" /></td>
                        <td><c:out value="${p.age}" /> mois</td>
                        <td><c:out value="${p.price}" /> €</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.status == 1}">
                                    <span style="color: blue;">Demande en attente</span>
                                </c:when>
                                <c:when test="${p.status == 2}">
                                    <span style="color: green;">Adopté</span>
                                </c:when>
                                <c:otherwise><span style="color: #FF9800; font-weight: bold; font-size: 0.8em;">EN LIGNE</span></c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${p.status == 1}">
                                    <div style="display: flex; flex-direction: column; gap: 5px;">
                                        <form action="DetailsServlet" method="get" style="margin:0;">
                                            <input type="hidden" name="type" value="demande">
                                            <input type="hidden" name="petId" value="${p.id}">
                                            <button type="submit"
                                                    style="background-color: #2196F3; color: white; padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-size: 0.9em;">
                                                👁️ Voir la demande
                                            </button>
                                        </form>
                                    </div>
                                </c:when>

                                <c:when test="${p.status == 2}">
                                    <div style="display: flex; flex-direction: column; gap: 5px;">
                                        <form action="DetailsServlet" method="post" style="margin:0;">
                                            <input type="hidden" name="type" value="commande">
                                            <input type="hidden" name="petId" value="${p.id}">
                                            <button type="submit"
                                                    style="background-color: #4CAF50; color: white; padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-size: 0.9em;">
                                                📄 Voir la facture
                                            </button>
                                        </form>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <div style="display: flex; flex-direction: column; gap: 5px;">
                                        <form action="PetSuppServlet" method="post" style="margin:0;">
                                            <input type="hidden" name="petId" value="${p.id}">
                                            <input type="hidden" name="nomVendeur" value="${user.nom}">
                                            <button type="submit" onclick="return confirm('Retirer l\'annonce ?');"
                                                    style="background-color: #f44336; color: white; border: none; padding: 6px 12px; cursor: pointer; border-radius: 4px; width: 100%; font-size: 0.9em;">
                                                🗑️ Retirer
                                            </button>
                                        </form>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <c:if test="${empty user.pets}">
                <p style="text-align: center; color: #999; margin-top: 20px;"><i>Vous n'avez aucune annonce en cours.</i></p>
            </c:if>
        </div>
    </c:when>
</c:choose>
</body>
</html>