package Model;

import java.io.Serializable;
import java.sql.Date;

public class Commande implements Serializable {
    private int id;
    private User user;
    private Pet pet;
    private Date date;
    private int status; //0:en attente 1:accepté 2:refusé

    public Commande(int id, User user, Pet pet) {
        this.id = id;
        this.user = user;
        this.pet = pet;
        this.date = new Date(System.currentTimeMillis());
        this.status = 0;
    }

    public Commande() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
