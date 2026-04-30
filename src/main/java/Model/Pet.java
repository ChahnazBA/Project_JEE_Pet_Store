package Model;

import java.io.Serializable;

public class Pet implements Serializable {
    private int id;
    private String race;
    private String sexe;
    private int age;
    private double price;
    private int status; //0:disponible 1:en attente 2:adopté

    public Pet(int id, String race, String sexe, int age, double price) {
        this.id = id;
        this.race = race;
        this.sexe = sexe;
        this.age = age;
        this.price = price;
        this.status = 0;
    }

    public Pet() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRace() {
        return race;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
