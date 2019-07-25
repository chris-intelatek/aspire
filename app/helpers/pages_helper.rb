module PagesHelper

  def calendly_link
    if current_user.group == "rs" || current_user.group == "ne" || current_user.group == "ls" || current_user.group == "ac" || 
      current_user.user_code == "rs" || current_user.user_code == "ne" || current_user.user_code == "ls" || current_user.user_code == "ac"
      '<li><a href="https://calendly.com/priority-greg/cpx" target="_New">Schedule a presentation with Greg McCarthy&#39;s Team</a></li>'
    elsif current_user.group == "se" || current_user.group == "cn" || current_user.group == "cc" || 
          current_user.user_code == "se" || current_user.user_code == "cn" || current_user.user_code == "cc"
      '<li><a href="https://calendly.com/priority-jason/cpx" target="_New">Schedule a presentation with Jason Arp&#39;s Team</a></li>'
    else
      '<li><a href="https://calendly.com/priority-greg/cpx" target="_New">Schedule a presentation with Greg McCarthy&#39;s Team</a></li>
      <li><a href="https://calendly.com/priority-jason/cpx" target="_New">Schedule a presentation with Jason Arp&#39;s Team</a></li>'
    end
  end

  def my_manager
    if current_user.group == "cc" || current_user.user_code == "cc" 
        'Chris Cunningham<br>chris@aspirepartners.co<br>(800) 410-0233 Ext 500<br>Mobile (910) 528-1421'
      elsif current_user.group == "rs" || current_user.user_code == "rs" 
        'Robert Sawyer<br>robert.sawyer@aspirepartners.co<br>(518) 424-8148'
      elsif current_user.group == "ne" || current_user.user_code == "ne" 
        'Neil Evans<br>neil.evans@aspirepartners.co<br>323-309-7225'                	  
    	elsif current_user.group == "ls" || current_user.user_code == "ls" 
    	  'Laura Sardilli<br>laura.sardilli@aspirepartners.co<br>(703) 628-5816'
    	elsif current_user.group == "ac" || current_user.user_code == "ac" 
    	  'Andy Charles<br>andy.charles@aspirepartners.co<br>(207)749-2631'
    	elsif current_user.group == "se" || current_user.user_code == "se" 
    	  'Stephanie Elad<br>stephanie.elad@aspirepartners.co<br>858-735-8904'              	  
    	elsif  current_user.group == "cn" || current_user.user_code == "cn" 
    	   'Chris Napier<br>chris.napier@aspirepartners.co<br>(717) 645-2413'
    	 else 
    	   'You do not have an assigned manager.  Please contact admin for manager assignment: admin@aspirepartners.co'
    end
  end
    
end