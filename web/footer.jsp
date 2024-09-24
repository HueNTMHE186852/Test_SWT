<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="footer1">
    <div class="footer-line"></div>
    <p>Chúng tôi rất muốn biết ý kiến của bạn!</p>
    <div class="centere.footertextd-btn">
        <button onclick="window.location.href='<%= request.getContextPath() %>/feedback.jsp'" class="shop-now-btnfooter">Gửi phản hồi</button>
    </div>
    <div class="secondfooter">
        <div class="left-section">
            <div class="copyright">
                <a class="footertext">© Tiny Tots Systems B.V. <%= java.time.Year.now().getValue() %></a>
            </div>
        </div>
        
        <!-- Added a container for both images -->
        <div class="tick-images-container">
            <div class="tick-image">
                <img src="<%= request.getContextPath() %>/img/tick.png" alt="Dấu tích">
            </div>
            <div class="tick-image">
                <img src="<%= request.getContextPath() %>/img/tick2.png" alt="Dấu tích 2">
            </div>
        </div>
        
        <div class="right-section">
            <a href="<%= request.getContextPath() %>/cookie-policy.jsp" class="footertext underline link-style">Chính sách cookie</a>
            <a href="<%= request.getContextPath() %>/privacy-policy.jsp" class="footertext underline link-style">Chính sách bảo mật</a>
        </div>
    </div>
</footer>