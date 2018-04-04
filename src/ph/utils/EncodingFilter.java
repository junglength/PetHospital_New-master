package ph.utils;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;

//@WebFilter(filterName = "EncodingFilter")
@WebFilter("/*")
public class EncodingFilter implements Filter {
    public void destroy()
    {
        System.out.println("中文编码验证过滤器销毁");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException
    {
        request.setCharacterEncoding("utf-8");
        System.out.println(((HttpServletRequest) request).getRequestURI());
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException
    {
        System.out.println("中文编码过滤器启动");
    }

}
