package Controller;

import Model.Gestionnaire;
import Model.Pet;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class InscriptionServlet extends HttpServlet {
    private Gestionnaire gestionnaire;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("inscription.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nom=req.getParameter("nom");
        String email=req.getParameter("email");
        String role=req.getParameter("role");

        User user=new User();
        user.setNom(nom);
        user.setEmail(email);
        user.setRole(role);
        ArrayList<Pet> pets=new ArrayList<>();
        user.setPets(pets);

        this.gestionnaire.getUsers().add(user);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        //req.getRequestDispatcher("tableau-bord.jsp").forward(req, resp);
        resp.sendRedirect("PetServlet");
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
