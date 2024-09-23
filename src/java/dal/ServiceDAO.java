/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Service;

/**
 *
 * @author LENOVO
 */
public class ServiceDAO extends DBContext {

    public List<Service> getAllServices() {
        List<Service> listServices = new ArrayList<>();
        String sql = "SELECT * FROM Services";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int ServiceID = rs.getInt("ServiceID");
                String ServiceName = rs.getString("ServiceName");
                String Description = rs.getString("Description");
                double Price = rs.getDouble("Price");
                int Duration = rs.getInt("Duration");
                String ServiceImage = rs.getString("ServiceImage");
                boolean IsActive = rs.getBoolean("IsActive");
                int AgeLimitID = rs.getInt("AgeLimitID");
                listServices.add(new Service(ServiceID, ServiceName, Description, Price, Duration, ServiceImage, IsActive, AgeLimitID));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listServices;
    }

    public void searchServiceByName(String search) {
        String sql = "SELECT * FROM Services\n"
                + "WHERE ServiceName LIKE %?%";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, search);
            pre.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertService(Service service) {
        String sql = "INSERT INTO Services (ServiceName, Description, Price, Duration, ServiceImage, IsActive, AgeLimitID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, service.getServiceName());
            pre.setString(2, service.getDescription());
            pre.setDouble(3, service.getPrice());
            pre.setInt(4, service.getDuration());
            pre.setString(5, service.getServiceImage());
            pre.setBoolean(6, service.isIsActive());
            pre.setInt(7, service.getAgeLimitID());
            pre.executeUpdate();

            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                service.setServiceID(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error inserting service: " + e.getMessage());
        }
    }
    
    public Service getServiceByID(int serviceID) {
        String sql = "SELECT * FROM Services WHERE serviceID = ?";
        try {
             PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, serviceID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    Service service = new Service();
                    service.setServiceID(rs.getInt("serviceID"));
                    service.setServiceName(rs.getString("serviceName"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setDuration(rs.getInt("duration"));
                    service.setServiceImage(rs.getString("serviceImage"));
                    service.setIsActive(rs.getBoolean("isActive"));
                    service.setAgeLimitID(rs.getInt("ageLimitID"));
                    return service;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void editService(Service service) {
        String sql = "UPDATE [dbo].[Services]\n"
                + "   SET [ServiceName] = <?>\n"
                + "      ,[Description] = <?>\n"
                + "      ,[Price] = <?>\n"
                + "      ,[Duration] = <?>\n"
                + "      ,[ServiceImage] = <?>\n"
                + "      ,[IsActive] = <?>\n"
                + "      ,[AgeLimitID] = <?>\n"
                + " WHERE ServiceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, service.getServiceName());
            pre.setString(2, service.getDescription());
            pre.setDouble(3, service.getPrice());
            pre.setInt(4, service.getDuration());
            pre.setString(5, service.getServiceImage());
            pre.setBoolean(6, service.isIsActive());
            pre.setInt(7, service.getAgeLimitID());
            pre.setInt(8, service.getServiceID());
            pre.executeUpdate();

            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                service.setServiceID(rs.getInt(1));
            }
        } catch (SQLException e) {
        }
    }

    public void deleteService(int ServiceID) {
        String sql = "DELETE FROM [Services]\n"
                + "WHERE ServiceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, ServiceID);
            pre.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        ServiceDAO dao = new ServiceDAO();
        dao.editService(dao.getAllServices().get(26));
        System.out.println(dao.getAllServices().get(26).getServiceName());
    }
}
