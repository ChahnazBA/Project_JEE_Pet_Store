package Model;

import java.util.ArrayList;

public class Gestionnaire{
    private static Gestionnaire instance = null;
    private ArrayList<Commande> commandes = new ArrayList<>();
    private ArrayList<User> users = new ArrayList<>();
    private ArrayList<Pet> pets = new ArrayList<>();
    private int dernierIdGlobal = 0;

    public Gestionnaire(ArrayList<Commande> commandes, ArrayList<User> users, ArrayList<Pet> pets) {
        this.commandes = commandes;
        this.users = users;
        this.pets = pets;
    }

    public Gestionnaire() {
    }

    public static synchronized Gestionnaire getInstance() {
        if (instance == null) {
            instance = new Gestionnaire();
        }
        return instance;
    }

    public ArrayList<Commande> getCommandes() {
        return commandes;
    }

    public void setCommandes(ArrayList<Commande> commandes) {
        this.commandes = commandes;
    }

    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }

    public ArrayList<Pet> getPets() {
        return pets;
    }

    public void setPets(ArrayList<Pet> pets) {
        this.pets = pets;
    }

    public int getDernierIdGlobal() {
        return dernierIdGlobal;
    }

    public void setDernierIdGlobal(int dernierIdGlobal) {
        this.dernierIdGlobal = dernierIdGlobal;
    }

    public synchronized int genererNouvelId() {
        dernierIdGlobal++;
        return dernierIdGlobal;
    }

    public User getVendeur(String nom) {
        User user=null;
        for (User u : users) {
            if (u.getNom().equals(nom) && u.getRole().equals("Vendeur")) {
                user=u;
            }
        }
        return user;
    }

    public User getAcheteur(String nom) {
        User user=null;
        for (User u : users) {
            if (u.getNom().equals(nom) && u.getRole().equals("Acheteur")) {
                user=u;
            }
        }
        return user;
    }

    public Pet getPetById(int id) {
        for (Pet p : this.pets) {
            if (p.getId() == id) return p;
        }
        return null;
    }

    public Commande getCommandeByPetId(int id) {
        for (Commande c : this.commandes) {
            if (c.getPet().getId() == id) return c;
        }
        return null;
    }

    public Commande getCommandeById(int id) {
        for (Commande c : this.commandes) {
            if (c.getId() == id) {
                return c;
            }
        }
        return null;
    }
}
