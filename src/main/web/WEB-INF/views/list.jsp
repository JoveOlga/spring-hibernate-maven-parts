<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="content">
<div class="container">
    <h2>Parts</h2>
    <div class="d-flex">
        <div class="p-2">
            <a class="btn btn-outline-secondary" href="<c:url value='/list'/>" role="button">All</a>
        </div>
        <div class="p-2">
            <a class="btn btn-outline-secondary" href="<c:url value='/list?filter=required'/>" role="button">Required</a>
        </div>
        <div class="p-2">
            <a class="btn btn-outline-secondary" href="<c:url value='/list?filter=optional'/>" role="button">Optional</a>
        </div>
        <div class="ml-auto p-2">
            <form action="/list">
                <div class="form-row">
                    <div class="col">
                        <label for="inputSearch" class="sr-only">Part name</label>
                        <input maxlength="256" name="needle" type="text" class="form-control" id="inputSearch" placeholder="Search" value="${needle}">
                    </div>
                    <div class="col">
                        <button type="submit" class="btn btn-secondary mb-2">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-striped">
        <col width="40%">
        <col width="15%">
        <col width="15%">
        <col width="15%">
        <col width="15%">
        <thead>
        <tr>
            <th>Name</th>
            <th>Necessity</th>
            <th>Quantity</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <c:forEach items="${parts}" var="part">
            <tr>
                <td>${part.name}</td>
                <td>${part.necessity? 'required' : 'optional'}</td>
                <td>${part.quantity}</td>
                <td><a href="<c:url value='/edit/${part.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/delete/${part.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>

    <p style="text-align: center">
        You can collect ${count} computers
    <p>
    <nav>
        <ul class="pagination justify-content-center">
            <c:if test="${current != 1}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value='/list?page=${current - 1}&filter=${filter}&needle=${needle}'/>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${pageCount}" var="i">
                <c:choose>
                    <c:when test="${current eq i}">
                        <li class="page-item"><a class="page-link">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="<c:url value='/list?page=${i}&filter=${filter}&needle=${needle}'/>">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${current lt pageCount}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value='/list?page=${current + 1}&filter=${filter}&needle=${needle}'/>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
    </div>
</rapid:override>

<%@ include file="base.jsp" %>
