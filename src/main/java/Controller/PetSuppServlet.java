package Controller;

import Model.Gestionnaire;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PetSuppServlet extends HttpServlet {
    private Gestionnaire gestionnaire;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idASupprimer = Integer.parseInt(req.getParameter("petId"));
        String nomVendeur = req.getParameter("nomVendeur");

        this.gestionnaire.getPets().removeIf(p -> p.getId() == idASupprimer);

        User vendeur = this.gestionnaire.getVendeur(nomVendeur);
        if (vendeur != null && vendeur.getPets() != null) {
            vendeur.getPets().removeIf(p -> p.getId() == idASupprimer);
        }
        resp.sendRedirect("tableau-bord.jsp");
    }

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
