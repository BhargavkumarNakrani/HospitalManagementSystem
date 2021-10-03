/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author rahul
 */
public class Medicines {
    
    private Integer id;
    private String name;
    private String type;
    private Integer unit;

    public Medicines(Integer id, String name, String type, Integer unit) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.unit = unit;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public Integer getUnit() {
        return unit;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setUnit(Integer unit) {
        this.unit = unit;
    }
    
    
}

