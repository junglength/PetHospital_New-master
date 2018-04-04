package ph.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ph.po.Speciality;
import ph.po.User;

public class UserDAO
{
    /**
     * 将user对象的name pwd role tel address保存成为一条t_user表中的记录
     * @param user
     * @throws Exception
     */
    public void save(User user) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root","123456");//  协议://域名(ip):端口/资源（数据库名）
            ps=con.prepareStatement("insert into t_user value(null,?,?,?,?,?)");
            ps.setString(1, user.getRole());
            ps.setString(2, user.getName());
            ps.setString(3, user.getPwd());
            ps.setString(4, user.getTel());
            ps.setString(5, user.getAddress());

            ps.executeUpdate();


        }catch(ClassNotFoundException e){
            e.printStackTrace();
            throw new Exception("找不到驱动:"+e.getMessage());//异常不能在底层丢失了
        }catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("数据库操作错误:"+e.getMessage());
        }
        finally{
            if(ps!=null)ps.close();
            if(con!=null)con.close();
        }

    }

    /**
     * 根据参数userName查找t_user表  如果找到记录就返回对应的封装对象User  没有就返回null
     * @param userName
     * @return
     */
    public User getByName(String userName) throws Exception{
        User user=null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root","123456");//  协议://域名(ip):端口/资源（数据库名）
            ps=con.prepareStatement("select * from t_user where name=?");
            ps.setString(1, userName);
            rs=ps.executeQuery();
            if(rs.next()){//如果if为true  表示找到了记录  此时才需要进行User对象的初始化(new User())以及 数据封装(setXxx)
                user=new User();
                user.setAddress(rs.getString("address"));;
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPwd(rs.getString("pwd"));
                user.setRole(rs.getString("role"));
                user.setTel(rs.getString("tel"));
            }

        }catch(ClassNotFoundException e){
            e.printStackTrace();
            throw new Exception("找不到驱动:"+e.getMessage());//异常不能在底层丢失了
        }catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("数据库操作错误:"+e.getMessage());
        }
        finally{
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(con!=null)con.close();
        }

        return user;
    }

    public List<User> searchCustomer(String cname) throws Exception{
        List<User> users = new ArrayList<User>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root", "123456");
            // 1.找符合条件的医生
            ps = con.prepareStatement("select * from t_user where name like ? and role='customer'");
            ps.setString(1, "%" + cname + "%");

            rs = ps.executeQuery();
            while (rs.next()) {// 这里查询的是t_vet.* 所以使用Vet封装
                User user=new User();
                user.setAddress(rs.getString("address"));;
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPwd(rs.getString("pwd"));
                user.setRole(rs.getString("role"));
                user.setTel(rs.getString("tel"));

                users.add(user);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new Exception("找不到驱动:" + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("SQL异常:" + e.getMessage());
        } finally {
            if (rs != null)
                rs.close();
            if (ps != null)
                ps.close();
            if (con != null)
                con.close();
        }

        return users;
    }

    public List<User> getAllCustomer() throws Exception
    {
        return searchCustomer("");
    }

    /**
     * 根据id查找t_user表 将找到的记录封装成为User对象返回
     * @param id
     * @return
     * @throws Exception
     */
    public User getById(int id) throws Exception{
        User user=null;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root","123456");//  协议://域名(ip):端口/资源（数据库名）
            ps=con.prepareStatement("select * from t_user where id=?");
            ps.setInt(1, id);
            rs=ps.executeQuery();
            if(rs.next()){//如果if为true  表示找到了记录  此时才需要进行User对象的初始化(new User())以及 数据封装(setXxx)
                user=new User();
                user.setAddress(rs.getString("address"));;
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPwd(rs.getString("pwd"));
                user.setRole(rs.getString("role"));
                user.setTel(rs.getString("tel"));
            }

        }catch(ClassNotFoundException e){
            e.printStackTrace();
            throw new Exception("找不到驱动:"+e.getMessage());//异常不能在底层丢失了
        }catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("数据库操作错误:"+e.getMessage());
        }
        finally{
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(con!=null)con.close();
        }
        return user;
    }

    /**
     * 根据客户ID删除t_usr表的一条记录
     * @param usrId
     * @throws Exception
     */
    public void delete(int usrId) throws Exception
    {
        Connection con = null;
        PreparedStatement ps = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root","123456");//  协议://域名(ip):端口/资源（数据库名）
            ps = con.prepareStatement("delete from t_user where id=?");
            ps.setInt(1, usrId);
            ps.executeUpdate();
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
            throw new Exception("找不到驱动:"+e.getMessage());//异常不能在底层丢失了
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            throw new Exception("数据库操作错误:"+e.getMessage());
        }
        finally
        {
            if(ps!=null)
            {
                ps.close();
            }
            if(con!=null)
            {
                con.close();
            }
        }
    }
}
