package com.neu.musicnet.customviews;

import java.awt.Color;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.neu.musicnet.model.Event;
import com.neu.musicnet.model.Person;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

public class PdfEventView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document document, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		
		
		
		Map<String,Event> eventData = (Map<String,Event>) model.get("eventData");
		 
		Table table = new Table(2);
		 table.setBorderWidth(1);
		 table.setBorderColor(new Color(0, 0, 255));
		 table.setPadding(5);
		 table.setSpacing(5);
		 Cell header = new Cell("Events");
		 header.setHeader(true);
		 header.setColspan(2);
		 table.addCell(header);
		 table.endHeaders();
		 
 
		for (Map.Entry<String, Event> entry : eventData.entrySet()) {
			Cell eventCell = new Cell("Event Name");
			eventCell.setColspan(2);
			table.addCell(eventCell);
			eventCell = new Cell(entry.getKey());
			eventCell.setColspan(2);
			table.addCell(eventCell);
			Event event = entry.getValue();
			if(event.getEventManagers() != null)
			{
				Cell cell = new Cell("Event Managers");
				cell.setColspan(2);
				table.addCell(cell);
				for(Person p : event.getEventManagers())
				{
					table.addCell("Name");
					table.addCell(p.getLastName() + "," + p.getFirstName());
				}
			}
			if(event.getMusicians() != null)
			{
				Cell cell = new Cell("Musicians");
				cell.setColspan(2);
				table.addCell(cell);
				for(Person p : event.getMusicians())
				{
					table.addCell("Name");
					table.addCell(p.getLastName() + "," + p.getFirstName());
				}
			}
		}
 
		document.add(table);
	}

	
}
