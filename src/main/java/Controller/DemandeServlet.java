package Controller;

import Model.Commande;
import Model.Gestionnaire;
import Model.Pet;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DemandeServlet extends HttpServlet {
    private Gestionnaire gestionnaire;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Commande cmd = new Commande();

        User acheteur = this.gestionnaire.getAcheteur(req.getParameter("nomAcheteur"));
        req.setAttribute("user", acheteur);
        int petId = Integer.parseInt(req.getParameter("petId"));
        Pet petAAdopter = this.gestionnaire.getPetById(petId);
        if (petAAdopter != null && petAAdopter.getStatus()==0) {
            petAAdopter.setStatus(1);

            int commandeId = this.gestionnaire.getCommandes().size() + 1;
            Commande nouvelleCommande = new Commande(commandeId, acheteur, petAAdopter);

            this.gestionnaire.getCommandes().add(nouvelleCommande);
            req.setAttribute("maDemande", nouvelleCommande);
        }
        req.getRequestDispatcher("demandeConfirmee.jsp").forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        this.gestionnaire = Gestionnaire.getInstance();
    }

    public Gestionnaire getGestionnaire() {
        return gestionnaire;
    }

    public void setGestionnaire(Gestionnaire gestionnaire) {
        this.gestionnaire = gestionnaire;
    }
}
