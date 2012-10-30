class User < ActiveRecord::Base
  
  attr_accessor   :password
  attr_accessible :name, :email, :password, :password_confirmation, :admin
  
  # email_regex = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  email_regex = /\w.+\@+\w.+\w+/i
  
  has_many :branches, :dependent => :destroy
    
  before_validation :downcase_email
  
  validates :name,  :presence => true,
                    :length => {:maximum => 50}
  
  validates :email, :presence => true,
                    :format => {:with => email_regex},
                    :uniqueness => {:case_sensitive => false}
  
  validates :password,  :presence => true, 
                        :confirmation => true,
                        :length => {:within => 6..40}
  
  before_save :encrypt_password,
              :downcase_email

  def has_password? (submitted_password)
    encrypted_password == encrypt(submitted_password) 
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email.downcase)
    (user && user.has_password?(submitted_password)) ? user : nil # this line replaces the two next below
    #return nil if user.nil?
    # return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end  
  
  
  private 
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(self.password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

# this was added (along with the before validation on email) to resolve the problem
# of case-sensitive e-mails
    def downcase_email
      self.email = self.email.downcase if self.email.present?
    end
  
end
