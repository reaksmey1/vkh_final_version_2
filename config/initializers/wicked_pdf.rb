if Rails.env.production?
  font_dir = File.join(Dir.home, ".fonts")
  Dir.mkdir(font_dir) unless Dir.exists?(font_dir)

  Dir.glob(Rails.root.join("vendor", "fonts", "*")).each do |font|
    target = File.join(font_dir, File.basename(font))
    File.symlink(font, target) unless File.exists?(target)
  end
end

if Rails.env.staging? || Rails.env.production?
  exe_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
else
  exe_path = '/usr/local/bin/wkhtmltopdf'
  # exe_path = '/usr/local/bin/wkhtmltopdf'
end

WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  :exe_path => exe_path
}
