class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true
  # validates :employees, :numericality => {:only_integer => true, :greater_than => 0}
  delegate :email, to: :user, allow_nil: true, prefix: true


  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << ["Advisor Name", "Advisor Email", "Advisor Phone", "Advisor Mobile",
      "Organization", "Status"]
      all.each do |prospect|
        advisor_name = prospect.user.advisor_first_name + " " + prospect.user.advisor_last_name
        csv << [advisor_name, prospect.user.email, prospect.user.advisor_phone,
              prospect.user.advisor_mobile, prospect.organization, prospect.cps_status]
      end
    end
  end


  # def self.to_csv
  #   CSV.generate(headers: true) do |csv|
  #     csv << column_names
  #     all.each do |prospect|
  #       csv << prospect.attributes.values_at(*column_names)
  #     end
  #   end
  # end

  
  def self.search(query)
    # Note that PostgreSQL is case specific for like when searching where sqlite3 is not
    where("LOWER(organization) like ?", "%#{query.downcase}%")
    # To search by more than one variable, do the following
    # where("LOWER(organization) like ? OR LOWER(status) like ?", "%#{query.downcase}%", "%#{query.downcase}%")
  end
  
end