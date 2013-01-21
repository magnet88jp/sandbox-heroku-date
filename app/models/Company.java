package models;
 
import java.util.*;
import javax.persistence.*;
 
import play.db.jpa.*;
import play.data.validation.*;
 
@Entity
public class Company extends Model {
 
  public String name;
  public Integer doctorNum;
    
  public Company() {
  }

}