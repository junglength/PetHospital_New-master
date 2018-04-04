package ph.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import ph.dao.VetDAO;
import ph.dao.VisitDAO;
import ph.po.Vet;
import ph.po.Visit;

import java.net.URLEncoder;


@WebServlet(name = "VisitServlet")//Servlet3.0提供了注解(annotation)，使得不再需要在web.xml文件中进行Servlet的部署描述，简化开发流程
public class VisitServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String m = request.getParameter("m");
        if ("showHistory".equals(m))
        {
            showHistory(request, response);
        }
        else if ("toAdd".equals(m))
        {
            toAdd(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            Visit visit = new Visit();
            visit.setPetId(Integer.parseInt(request.getParameter("pid")));
            visit.setVetId(Integer.parseInt(request.getParameter("vid")));
            //缺少visitdate,原因是在visitDAO.save()中用MySQL的CURDATE()函数获取当前日期
            visit.setDescription(request.getParameter("description"));
            visit.setTreatment(request.getParameter("treatment"));
            VisitDAO visitDAO = new VisitDAO();
            visitDAO.save(visit);
            request.setAttribute("msg", "病历添加成功");
            response.sendRedirect("CustomerServlet?mode=saveVisit&cid="+request.getParameter("cid"));
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/customersearch.jsp").forward(request, response);
        }
    }



    private void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            VetDAO vetDAO = new VetDAO();
            List<Vet> vets = vetDAO.getAll();
            request.setAttribute("vets", vets);
            request.getRequestDispatcher("/visitadd.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/customersearch.jsp").forward(request, response);
        }
    }

    private void showHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            VisitDAO visitDAO = new VisitDAO();
            List<Visit> visits = visitDAO.getVisitsByPetId(Integer.parseInt(request.getParameter("petId")));
            request.setAttribute("visits", visits);
            if (visits.size() == 0)
            {
                request.setAttribute("msg", "没有找到历史病历");
            }
            request.getRequestDispatcher("/visitsearch_result.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("/customersearch.jsp").forward(request, response);
        }
    }
}
