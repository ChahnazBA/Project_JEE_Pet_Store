package Controller;

import Model.Gestionnaire;
import Model.Pet;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class PetServlet extends HttpServlet {
    private Gestionnaire gestionnaire;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("catalogue", this.gestionnaire.getPets());
        req.getRequestDispatcher("tableau-bord.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Pet pet=new Pet();
        pet.setRace(req.getParameter("race"));
        pet.setSexe(req.getParameter("sexe"));
        int age =Integer.parseInt(req.getParameter("age"));
        pet.setAge(age);
        double price =Double.parseDouble(req.getParameter("price"));
        pet.setPrice(price);
        pet.setStatus(0);

        User user = this.gestionnaire.getVendeur(req.getParameter("nomVendeur"));
        if (user.getPets() == null && !user.getPets().isEmpty()) {
            user.setPets(new ArrayList<Pet>());
        }
        int uniqueId = gestionnaire.genererNouvelId();
        pet.setId(uniqueId);

        user.getPets().add(pet);
        this.gestionnaire.getPets().add(pet);

        resp.sendRedirect("tableau-bord.jsp");
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
