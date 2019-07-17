module PagesHelper

  def calendly_link
    if current_user.group == "rs" || current_user.group == "ne" || current_user.group == "ls" || current_user.group == "ac" || 
      current_user.user_code == "rs" || current_user.user_code == "ne" || current_user.user_code == "ls" || current_user.user_code == "ac"
      '<li><a href="https://calendly.com/priority-greg/cpx" target="_New">Schedule a presentation for your client with an expert at Priority Commercial Payments</a></li>'
    elsif current_user.group == "se" || current_user.group == "cn" || current_user.group == "cc" || 
          current_user.user_code == "se" || current_user.user_code == "cn" || current_user.user_code == "cc"
      '<li><a href="https://calendly.com/priority-jason/cpx" target="_New">Schedule a presentation for your client with an expert at Priority Commercial Payments</a></li>'
    else
      '<li><a href="https://calendly.com/priority-greg/cpx" target="_New">Schedule a presentation with Greg McCarthy</a></li>
      <li><a href="https://calendly.com/priority-jason/cpx" target="_New">Schedule a presentation with Jason Arp</a></li>'
    end
  end
    
end