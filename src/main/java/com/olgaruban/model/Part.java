package com.olgaruban.model;

import javax.persistence.*;

@Entity
@Table(name = "part")
public class Part {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "necessity")
    private boolean necessity;

    @Column(name = "quantity")
    private int quantity;

    public Part() {
    }

    public Part(long id, String name, boolean necessity, int quantity) {
        this.id = id;
        this.name = name;
        this.necessity = necessity;
        this.quantity = quantity;
    }
    public Part(String name, boolean necessity, int quantity) {
        this.name = name;
        this.necessity = necessity;
        this.quantity = quantity;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isNecessity() {
        return necessity;
    }

    public void setNecessity(boolean necessity) {
        this.necessity = necessity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
