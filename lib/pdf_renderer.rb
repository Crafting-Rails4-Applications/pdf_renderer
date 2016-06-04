module PdfRenderer
	require 'prawn'

	ActionController::Renderers.add :pdf do |filename, options| #Add new pdf option to render method
		pdf = Prawn::Document.new #Create a new pdf
		pdf.text render_to_string(options) #returns a string instead of sending a response back to the browser
		send_data(pdf.render, filename: "#{filename}.pdf", disposition: "attachment")
	end
end
