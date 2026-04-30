package Controller;

import Model.Commande;
import Model.Gestionnaire;
import Model.Pet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdoptionServlet extends HttpServlet {
    private Gestionnaire gestionnaire;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cmdIdStr = req.getParameter("cmdId");
        String decision = req.getParameter("decision");

        if (cmdIdStr != null && decision != null) {
            int cmdId = Integer.parseInt(cmdIdStr);

            Commande cmd = gestionnaire.getCommandeById(cmdId);

            if (cmd != null) {
                Pet pet = cmd.getPet();

                if ("valider".equals(decision)) {
                    pet.setStatus(2);
                    cmd.setStatus(1);
                    this.gestionnaire.getPets().remove(pet);

                } else if ("refuser".equals(decision)) {
                    pet.setStatus(0);
                    cmd.setStatus(2);
                }
            }
        }
        //resp.sendRedirect("tableau-bord.jsp");
        resp.sendRedirect("PetServlet");
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
