package dal;

import model.Blog;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO extends DBContext {

public void addBlog(Blog blog) {
    String sql = "INSERT INTO Blogs (Title, Content, AuthorName, CreatedDate, UpdatedDate, IsPublished, ThumbnailPath, Views) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
        pstmt.setString(1, blog.getTitle());
        pstmt.setString(2, blog.getContent());
        pstmt.setString(3, blog.getAuthorName());
        pstmt.setDate(4, new java.sql.Date(System.currentTimeMillis()));
        pstmt.setDate(5, new java.sql.Date(System.currentTimeMillis()));
        pstmt.setBoolean(6, blog.isPublished());
        pstmt.setString(7, blog.getThumbnailPath());
        pstmt.setInt(8, 0); // Default views to 0

        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
public Blog getBlogById(int blogID) {
    Blog blog = null;
    String sql = "SELECT * FROM Blogs WHERE BlogID = ?";

    try (
        PreparedStatement pstmt = connection.prepareStatement(sql)) {
        pstmt.setInt(1, blogID);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            blog = new Blog();
            blog.setBlogID(rs.getInt("BlogID"));
            blog.setTitle(rs.getString("Title"));
            blog.setContent(rs.getString("Content"));
            blog.setAuthorName(rs.getString("AuthorName"));
            blog.setCreatedDate(rs.getDate("CreatedDate"));
            blog.setUpdatedDate(rs.getDate("UpdatedDate"));
            blog.setIsPublished(rs.getBoolean("IsPublished"));
            blog.setThumbnailPath(rs.getString("ThumbnailPath"));
            blog.setViews(rs.getInt("Views"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return blog;
}


 public List<Blog> getAllBlogs() {
        List<Blog> blogList = new ArrayList<>();
        String sql = "SELECT * FROM Blogs";

        try (
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setTitle(rs.getString("Title"));
                blog.setContent(rs.getString("Content"));
                blog.setAuthorName(rs.getString("AuthorName"));
                blog.setCreatedDate(rs.getDate("CreatedDate"));
                blog.setUpdatedDate(rs.getDate("UpdatedDate"));
                blog.setIsPublished(rs.getBoolean("IsPublished"));
                blog.setThumbnailPath(rs.getString("ThumbnailPath"));
                blog.setViews(rs.getInt("Views"));

                blogList.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return blogList;
    }
 public boolean deleteBlog(int blogID) {
        String sql = "DELETE FROM Blogs WHERE blogID = ?";
        try (
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, blogID);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
  public static void main(String[] args) {
        BlogDAO blogDAO = new BlogDAO();
        
        // Lấy danh sách các blog
        List<Blog> blogs = blogDAO.getAllBlogs();
        
        // In danh sách blog ra console
        for (Blog blog : blogs) {
            System.out.println("Blog ID: " + blog.getBlogID());
            System.out.println("Title: " + blog.getTitle());
            System.out.println("Author: " + blog.getAuthorName());
            System.out.println("Created Date: " + blog.getCreatedDate());
            System.out.println("Is Published: " + blog.isPublished());
            System.out.println("Views: " + blog.getViews());
            System.out.println("-----------------------------------");
        }
    }
}
