class OnlineDonationController < ApplicationController
  skip_before_filter :verify_authenticity_token
  layout "loggedin" , except: [:login,:signup,:home]
  
  def home
    session[:msg]=nil
    if(session[:stat]=="from login")
      redirect_to :action=>"profile"
    end
  end

  def login
  end

  def signupaction
    @user=User.new
    @user.name=params["name"]
    @user.uname=params["uname"]
    @user.password=params["passwd"]
    @user.dob=params["dob"]
    @user.mail=params["mail"]
    @user.phone=params["phone"]
    @user.address=params["address"]
    @user.gender=params["gender"]
    if(@user.save)
      redirect_to :action=>"login"
    else
      redirect_to :action=>"failed"
    end
  end

  def loginaction
    @u=User.find_by_uname(params["uname"])
      if(@u)
        if(@u.password == params["passwd"])
          session[:user] = @u.uname
          session[:stat] = "from login"
          session[:msg]=nil
          redirect_to :action=>"profile"
        else
          session[:msg]="*Invalid password..Try again"
          redirect_to :action=>"login"
        end
      else
        session[:msg]="*No such user found..Try again"
        redirect_to :action=>"login"
      end
  end

  def profile
    if(session[:user]!=nil)
      session[:search]=nil
      @u=User.find_by_uname(session[:user])
      @events=Event.all
      session[:search]=params["search"]
    else
      redirect_to :action=>"login"
    end
  end

  def settings
  end

  def moveaction
    if(params["passwd"]!=nil)
      redirect_to :action=>"changepwd"
    else
      redirect_to :action=>"uploadpic"
    end
  end

  def changepwd
  end
  
  def changeaction
    @u=User.find_by_uname(session[:user])
    session[:msg]=nil
    if(params["old"]!=@u.password)
      session[:msg]="* Invalid password Try again"
    elsif(params["old"]==params["newp"])
      session[:msg]="* Similar to old password Try again"
    elsif(params["newp"]!=params["cnewp"])
      session[:msg]="* Passwords didn't match Try again"
    end
    if(session[:msg]==nil)
      User.update(@u.id,:password=>params["newp"])
      redirect_to :action=>"profile"
    else
      redirect_to :action=>"changepwd"
    end
  end

  def signup
    session[:msg]=nil
  end

  def donate
    @u=User.find_by_uname(session[:user])
    @acnt=UserAcnt.all
    session[:eventid]=params["donate"]
  end

  def donatemoney
    if(params["donate"]!=nil)
      session[:acNo]=params["donate"]
      @msg=session[:msg]
      redirect_to :action=>"donateform"
    elsif(params["remove"]!=nil)
      @acnt=UserAcnt.find_by_acNo(params["remove"])
      @acnt.delete
      redirect_to :action=>"donate"
    end
  end

  def donateamnt
    @bank=BankAcnt.find_by_acntNo(session[:acNo])
    @event=Event.find_by_id(session[:eventid])
    @dest=BankAcnt.find_by_acntNo(@event.acNo)
    @user=User.find_by_uname(session[:user])
    if((params["amnt"].to_i) %10!=0)
      session[:msg]="*Enter Reasonable denomination"
      redirect_to :action=>"donateform"
    elsif(@bank.balance > params["amnt"].to_i)
      session[:msg]=nil
      @donation=Donordetail.new
      @donation.eventid=session[:eventid]
      @donation.donorid=@user.id
      @donation.amnt=params["amnt"]
      @donation.acntNo=session[:acNo].to_i
      bal=@bank.balance-params["amnt"].to_i
      cbal=@dest.balance+params["amnt"].to_i
      abal=@event.collectedAmnt+params["amnt"].to_i
      if(BankAcnt.update(@bank.id,:balance=>bal) and BankAcnt.update(@dest.id,:balance=>cbal) and @donation.save and Event.update(@event.id,:collectedAmnt=>abal))
        session[:name]=@user.name
        session[:amnt]=@donation.amnt
        session[:acnt]=@donation.acntNo
        session[:ename]=@event.eventName
        session[:bal]=bal
        redirect_to :action=>"success"
      else
        redirect_to :action=>"failed"
      end
    else
      session[:msg]="*Balance is low to perform transaction"
      redirect_to :action=>"donateform"
    end
  end

  def donateform
    @acnt=BankAcnt.find_by_acntNo(session[:acNo])
  end

  def createEvent
  end

  def addAcnt
  end

  def doaction
    @acnts=BankAcnt.all
    count=0
    @uacnt=UserAcnt.new
    @u=User.find_by_uname(session[:user])
    @acnts.each do |a|
      count+=1
      if(a.acntNo==params["acnt"].to_i)
        @uacnt.userNo=@u.id
        @uacnt.acNo=params["acnt"]
        @uacnt.save
        redirect_to :action=>"donate"
      end
    end
  end

  def createaction
    @event=Event.new
    @u=User.find_by_uname(session[:user])
    @event.organizer=@u.id
    @event.eventName=params["name"]
    @event.caption=params["caption"]
    @event.tags=params["tags"]
    @event.trustname=params["trust"]
    @event.location=params["address"]
    @event.estAmnt=params["estamnt"]
    @event.collectedAmnt=0
    @event.endDate=params["endDate"]
    @event.acNo=params["acNo"]
    @event.ifscCode=params["ifsc"]
    if(@event.save)
      redirect_to :action=>"profile"
    else
      redirect_to :action=>"failed"
    end
  end

  def sendto
    
  end

  def getdetails
    @donationDet=Donordetail.all
    @u=User.find_by_uname(session[:user])
  end

  def getevents
    @u=User.find_by_uname(session[:user])
    @events=Event.all
  end

  def logout
    session[:user] = nil
    session[:stat]= nil
    session[:msg]=nil
    redirect_to :action=>"home"
  end

  def editEvent
    if(params["submit"]!=nil)
      session[:submit]=params["submit"]
      redirect_to :action=>"submitDetails"
    elsif(params["edit"]!=nil)
      detail=params["edit"]
      @details=detail.split(" ")
      @event=Event.find_by_id(@details[0])
    else
      session[:view]=params["details"]
      redirect_to :action=>"viewDetails"
    end
  end

  def submitDetails
    detail=session[:submit]
    @details=detail.split(" ")
    @event=Event.find_by_id(@details[0])
  end

  def updateaction
    if(Event.update(session[:eventid],:eventName=>params["name"],
      :caption=>params["caption"],:tags=>params["tags"],
      :endDate=>params["endDate"],:estAmnt=>params["estamnt"]))
      redirect_to :action=>"profile"
    else
      redirect_to :action=>"failed"
    end
  end

  def viewDetails
    detail=session[:view]
    @details=detail.split(" ")
    @event=Event.find_by_id(@details[0])
    @donations=Donordetail.all
  end

  def submitDet
    cnt=1
    while(params["desc#{cnt}"]!=nil and params["amnt#{cnt}"]!=nil)
      @data=Moneydetail.new
      @data.organizerid=Event.find_by_id(session[:eventid]).id
      @data.eventid=session[:eventid]
      @data.description=params["desc#{cnt}"]
      @data.amount=params["amnt#{cnt}"]
      @data.save
      cnt+=1
    end
    redirect_to :action=>"profile"
  end
end
