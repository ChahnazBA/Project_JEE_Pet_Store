package Model;

import java.io.Serializable;
import java.util.ArrayList;

public class User implements Serializable {
    private String nom;
    private String email;
    private String role;
    private ArrayList<Pet> pets;

    public User(String nom, String email, String role) {
        this.nom = nom;
        this.email = email;
        this.role = role;
        this.pets = new ArrayList<>();
    }

    public User() {
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public ArrayList<Pet> getPets() {
        return pets;
    }

    public void setPets(ArrayList<Pet> pets) {
        this.pets = pets;
    }
}
