package ph.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ph.po.Speciality;


public class SpecialityDAO
{
    /**
     * 返回所有的专业，select * from t_speciality  ==>  List
     * @return
     * @throws Exception
     */
    public List<Speciality> getAll() throws Exception
    {
        List<Speciality> specs = new ArrayList<Speciality>();
        //Step1   需要完成DAO
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root","123456");//  协议://域名(ip):端口/资源（数据库名）
            ps = con.prepareStatement("select * from t_speciality");

            rs = ps.executeQuery();
            while(rs.next())
            {//如果if为true  表示找到了记录  此时才需要进行User对象的初始化(new User())以及 数据封装(setXxx)
                Speciality s=new Speciality();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                specs.add(s);
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
        return specs;
    }

    public void save(Speciality spec) throws Exception
    {
        Connection con = null;
        PreparedStatement ps = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ph","root", "123456");// 协议://域名(ip):端口/资源（数据库名）
            ps = con.prepareStatement("insert into t_speciality value(null,?,?)");
            ps.setString(1, spec.getName());
            ps.setString(2, spec.getDesc());
            ps.executeUpdate();
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
            throw new Exception("找不到驱动:" + e.getMessage());// 异常不能在底层丢失了
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            throw new Exception("数据库操作错误:" + e.getMessage());
        }
        finally
        {
            if (ps != null)
            {
                ps.close();
            }
            if (con != null)
            {
                con.close();
            }
        }
    }
}
