package Controller;

import Model.Gestionnaire;
import Model.Commande;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DetailsServlet extends HttpServlet {
    private Gestionnaire gestionnaire;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        traiterRequete(req, resp, "details-demande.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        traiterRequete(req, resp, "details-commande.jsp");
    }

    private void traiterRequete(HttpServletRequest req, HttpServletResponse resp, String jspDest) throws ServletException, IOException {
        try {
            int petId = Integer.parseInt(req.getParameter("petId"));

            Commande cmd = gestionnaire.getCommandeByPetId(petId);

            if (cmd != null) {
                req.setAttribute("commande", cmd);
                req.getRequestDispatcher(jspDest).forward(req, resp);
            } else {
                //resp.sendRedirect("tableau-bord.jsp?error=notfound");
                resp.sendRedirect("PetServlet");
            }
        } catch (NumberFormatException e) {
            //resp.sendRedirect("tableau-bord.jsp");
            resp.sendRedirect("PetServlet");
        }
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
