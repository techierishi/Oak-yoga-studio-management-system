/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.oak_yoga_studio.domain;

import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Weldu
 */

@Entity
public class Enrollment {
  
    
    @Id
    @GeneratedValue
    private int id;
    
    
    public enum statusType{
        ACTIVE,WAITINGLIST,WITHDRAWAL,COMPLETED;
    }
    
    @Enumerated(EnumType.STRING)
    private statusType status;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date enrollmentDate;
    
    @ManyToOne
    @JoinColumn(name="customer_id")
    private Customer customer;
    
    @ManyToOne
    @JoinColumn(name="section_id")
    private Section section;

    public Enrollment() {
    }   

    public Enrollment(statusType status, Date enrollmentDate, Customer customer, Section section) {
        this.status = status;
        this.enrollmentDate = enrollmentDate;
        this.customer = customer;
        this.section = section;
    }

    

       
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public statusType getStatus() {
        return status;
    }

    public void setStatus(statusType status) {
        this.status = status;
    }

    

    public Date getEnrollmentDate() {
        return enrollmentDate;
    }

    public void setEnrollmentDate(Date enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + (this.status != null ? this.status.hashCode() : 0);
        hash = 41 * hash + (this.enrollmentDate != null ? this.enrollmentDate.hashCode() : 0);
        hash = 41 * hash + (this.customer != null ? this.customer.hashCode() : 0);
        hash = 41 * hash + (this.section != null ? this.section.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Enrollment other = (Enrollment) obj;
        if (this.status != other.status) {
            return false;
        }
        if (this.enrollmentDate != other.enrollmentDate && (this.enrollmentDate == null || !this.enrollmentDate.equals(other.enrollmentDate))) {
            return false;
        }
        if (this.customer != other.customer && (this.customer == null || !this.customer.equals(other.customer))) {
            return false;
        }
        if (this.section != other.section && (this.section == null || !this.section.equals(other.section))) {
            return false;
        }
        return true;
    }
    
    
    
}
