<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>学生信息管理页面</title>
  </head>
  
  <body>
     <%
     //1.加载数据库驱动
      Class.forName("com.mysql.jdbc.Driver");
      //2.通过DriverManager获取数据库连接
      String url="jdbc:mysql://localhost:3306/student";    //tudent为数据库名  
      Connection con=DriverManager.getConnection(url,"root","root");
      //3.通过Connection对象获取Statenment对象
      Statement st=con.createStatement();
      //4.使用Statenment执行sql语句
      String sql="select * from stuInfo";
      ResultSet rs=st.executeQuery(sql);//查询语句
      //5.操作ResultSet结果集
      %>
      <table border="1">
      <tr>
         <th>学号</th>
         <th>姓名</th>
         <th>密码</th>
         <th>性别</th>
         <td><a href="JDBC/AddInfo.jsp">添加</a></td>
      </tr>
      <%
      	while(rs.next()){
        int sid=rs.getInt("stuId");//按属性名获取值
        String sname=rs.getString(2);//按列号获取值
        String spwd=rs.getString("stuPwd");
        String ssex=rs.getString("stuSex");
        %>
        <tr>
          <td><%=sid %></td>
          <td><%=sname %></td>
          <td><%=spwd %></td>
          <td><%=ssex%></td>
          <!-- 注意传值?stuId=<%=sid %>过去 -->
          <td><a href="JDBC/UpdateInfo.jsp?stuId=<%=sid %>&stuName=<%=sname%>&stuPwd=<%=spwd%>&stuSex=<%=ssex%>">修改</a></td>
          
          <td><a href="JDBC/DeleteInfo.jsp?stuId=<%=sid %>" onclick="if(confirm('确认删除？')==false)return false;">删除</a></td>
        </tr>
      <%      
      }
      //6.回收数据库资源
      rs.close();
      st.close();
      con.close();
     %>
     </table>
  </body>
</html>
