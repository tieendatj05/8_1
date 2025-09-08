package web;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet(name="EmailListServlet", urlPatterns={"/emailList"})
public class EmailListServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp);
    }

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String first = req.getParameter("firstName");
        String last  = req.getParameter("lastName");
        String email = req.getParameter("email");

        // Validate input
        if (first == null || first.isBlank()
                || last == null || last.isBlank()
                || email == null || email.isBlank()) {
            req.setAttribute("error", "Please fill out all fields.");
            req.setAttribute("firstName", first);
            req.setAttribute("lastName", last);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp);
            return;
        }

        // Save email list in application scope
        ServletContext app = getServletContext();
        List<String> list = (List<String>) app.getAttribute("emailList");
        if (list == null) {
            list = new ArrayList<>();
            app.setAttribute("emailList", list);
        }
        if (!list.contains(email)) {
            list.add(email);
        }

        // Time added
        String addedAt = DateTimeFormatter.ofPattern(
                "EEE MMM dd HH:mm:ss 'UTC' yyyy", Locale.ENGLISH)
                .format(OffsetDateTime.now(ZoneOffset.UTC));

        req.setAttribute("firstName", first);
        req.setAttribute("lastName",  last);
        req.setAttribute("email",     email);
        req.setAttribute("addedAt",   addedAt);
        req.setAttribute("firstOnList",  list.size() >= 1 ? list.get(0) : null);
        req.setAttribute("secondOnList", list.size() >= 2 ? list.get(1) : null);

        req.getRequestDispatcher("/WEB-INF/thanks.jsp").forward(req, resp);
    }
}
