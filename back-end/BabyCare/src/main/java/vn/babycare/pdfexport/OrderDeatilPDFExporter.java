package vn.babycare.pdfexport;

import java.awt.Color;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;

import com.lowagie.text.pdf.PdfWriter;

import vn.babycare.constant.FilePath;
import vn.babycare.model.Order;
import vn.babycare.model.OrderDetail;
import vn.babycare.model.Product;

public class OrderDeatilPDFExporter {
	private List<Product> listP;
	private List<OrderDetail> listOrderDetails;
	private Order order;

	public OrderDeatilPDFExporter(List<Product> listP) {
		super();
		this.listP = listP;
	}

	public OrderDeatilPDFExporter(List<OrderDetail> listOrderDetails, Order order) {
		super();
		this.listOrderDetails = listOrderDetails;
		this.order = order;
	}

	private void writeTableHeader(PdfPTable table) throws DocumentException, IOException {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.WHITE);
		cell.setPadding(5);

		Font f = new Font(BaseFont.createFont(FilePath.Url.FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED));

		f.setColor(Color.BLACK);
		f.setSize(14);
		f.setStyle(Font.BOLD);

		cell.setPhrase(new Phrase("STT", f));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Mã", f));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Tên sản phẩm", f));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Số lượng", f));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Đơn giá", f));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Thành tiền", f));
		table.addCell(cell);
	}

	private void writeTableData(PdfPTable table) throws DocumentException, IOException {
		Font f = new Font(BaseFont.createFont(FilePath.Url.FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED));

		f.setColor(Color.BLACK);
		f.setSize(14);
		f.setStyle(Font.NORMAL);
		PdfPCell cell = new PdfPCell();
		int index = 1;
		for(OrderDetail orderDetail : listOrderDetails) {
			Product product = orderDetail.getProduct();
			cell.setPhrase(new Phrase(String.valueOf(index), f));
			table.addCell(cell);
			
			cell.setPhrase(new Phrase(product.getCode(), f));
			table.addCell(cell);
			
			cell.setPhrase(new Phrase(product.getName(), f));
			table.addCell(cell);

			cell.setPhrase(new Phrase(String.valueOf(orderDetail.getQuantity()), f));
			table.addCell(cell);

			cell.setPhrase(new Phrase(formatPrice(product.getSaleSellPrice()), f));
			table.addCell(cell);
			
			BigDecimal total = product.getSaleSellPrice().multiply(new BigDecimal(orderDetail.getQuantity().toString()));	    
			cell.setPhrase(new Phrase(formatPrice(total), f));
			table.addCell(cell);		
			
			index++;
		}	
	}
	
	public String formatPrice(BigDecimal price) {
		DecimalFormat df = new DecimalFormat("#,##0.00");
        String totalVND = df.format(price);
        return totalVND;
	}

	public void export(HttpServletResponse response) throws DocumentException, IOException {
		Document document = new Document(PageSize.A4);

		PdfWriter.getInstance(document, response.getOutputStream());

		document.open();

		Font fHeader = new Font(BaseFont.createFont(FilePath.Url.FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED));
		fHeader.setColor(Color.BLACK);
		fHeader.setSize(16);
		fHeader.setStyle(Font.BOLD);

		Paragraph pHeader = new Paragraph("HÓA ĐƠN BÁN HÀNG", fHeader);
		pHeader.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(pHeader);

		Font fContent = new Font(BaseFont.createFont(FilePath.Url.FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED));
		fContent.setColor(Color.BLACK);
		fContent.setSize(14);
		fContent.setStyle(Font.NORMAL);

		Paragraph pCode = new Paragraph("Mã đơn hàng: " + order.getId(), fContent);
		document.add(pCode);

		Paragraph pName = new Paragraph("Tên khách hàng: " + order.getCustomerName(), fContent);
		document.add(pName);

		Paragraph pMobile = new Paragraph("Số điện thoại: " + order.getCustomerMobile(), fContent);
		document.add(pMobile);

		Paragraph pAddress = new Paragraph("Địa chỉ: " + order.getCustomerAddress(), fContent);
		document.add(pAddress);

		PdfPTable table = new PdfPTable(6);
		table.setWidthPercentage(100f);
		table.setWidths(new float[] { 1.0f, 1.5f, 3.5f, 2.0f, 2.5f, 3.0f });
		table.setSpacingBefore(10);

		writeTableHeader(table);
		writeTableData(table);

		document.add(table);
		
		Paragraph totalOrder = new Paragraph("Tổng cộng: " + formatPrice(order.getTotal()), fContent);
		totalOrder.setAlignment(Paragraph.ALIGN_RIGHT);
		document.add(totalOrder);
		
		Paragraph pNote = new Paragraph("Ghi chú: " + order.getNote(), fContent);
		document.add(pNote);
	
		
		document.close();
	}
}
