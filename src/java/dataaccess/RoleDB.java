/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;
import models.User;
import models.Role;
/**
 *
 * @author Patrick
 */
public class RoleDB {
        
    public List<Role> getAll(String owner) throws Exception {
     EntityManager em = DBUtil.getEmFactory().createEntityManager();

        
        
        try {
            Role role = em.find(Role.class, owner);
            return role.getUserList();
            

            }
            
        
        finally {
    em.close();
        }
        
        
        
        
        
    }
    
    public Role get(int roleID) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        
        try {
        Role role = em.find(Role.class, roleID);
        
        return role;
                
            
        } finally {
            em.close();
   
        }
      
    }
    
    public void insert(Role role) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
       User user = user.getOwner();
       user.getRoleList().add(role);
        trans.begin();
        em.persist(role);
        em.merge(role);
        trans.commit();
        }
        catch (Exception ex) {
            trans.rollback();
        }
        
        finally {
            em.close();
        }
        
        
    }
    
    public void update(Role role) throws Exception {
     
        try {
      trans.begin();
      em.merge(role);
      
        }
        
        catch (Exception ex) {
            
        }
        
        finally {
        }
        
    }
    
    public void delete(Role role) throws Exception {
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        String sql = "delete from role where role_id=?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, role.getRoleID());
            ps.executeUpdate();
            
        }
        finally {
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }
        
                
    }

}

