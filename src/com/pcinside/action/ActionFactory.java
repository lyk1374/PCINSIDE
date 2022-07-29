package com.pcinside.action;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() { }
	public static ActionFactory getInstance() {
		return instance;
	}
	Action getAction(String command) {
		Action action = null;
		switch(command) {
		case "adminpage":
			action = new AdminPage();
			break;
		case "logout":
			action = new LogoutAction();
			break;
		case "mypage":
			action = new MyPage();
			break;
		case "announcement":
			action = new Announcement();
			break;
		case "announcementshow":
			action = new AnnouncementShow();
			break;
		case "announcementmodify":
			action = new AnnouncementModify();
			break;
		case "announcementmodifyaction":
			action = new AnnouncementModifyAction();
			break;
		case "announcementwrite":
			action = new AnnouncementWrite();
			break;
		case "announcementwriteaction":
			action = new AnnouncementWriteAction();
			break;
		case "announcementdelete":
			action = new AnnouncementDeleteAction();
			break;
		case "hotitem":
			action = new HotItem();
			break;
		case "inquiry":
			action = new Inquiry();
			break;
		case "inquiryaction":
			action = new InquiryAction();
			break;
		case "buypc":
			action = new BuyPC();
			break;
		case "buypcdetail":
			action = new BuyPCDetail();
			break;
		case "buypcin":
			action = new BuyPCIn();
			break;
		case "likeaction":
			action = new LikeAction();
			break;
		case "unlikeaction":
			action = new UnLikeAction();
			break;
		case "faq":
			action = new Faq();
			break;
		case "freeboard":
			action = new FreeBoard();
			break;
		case "freeboardshow":
			action = new FreeBoardShow();
			break;
		case "freeboarddeleteaction":
			action = new FreeBoardDeleteAction();
			break;
		case "freeboardwrite":
			action = new FreeBoardWrite();
			break;
		case "freeboardwriteaction":
			action = new FreeBoardWriteAction();
			break;
		case "freeboardmodify":
			action = new FreeBoardModify();
			break;
		case "freeboardmodifyaction":
			action = new FreeBoardModifyAction();
			break;
		case "freeboardcommentwriteaction":
			action = new FreeBoardCommentWriteAction();
			break;
		case "freeboardcommentmodifyaction":	
			action = new FreeBoardCommentModifyAction();
			break;
		case "freeboardcommentdeleteaction":
			action = new FreeBoardCommentDeleteAction();
			break;
		case "login":
			action = new Login();
			break;
		case "loginaction":
			action = new LoginAction();
			break;
		case "loginactionkakao":
			action = new LoginActionKakao();
			break;
		case "loginactionnaver":	
			action = new LoginActionNaver();
			break;
		case "searchidpw":
			action = new SearchIdPw();
			break;
		case "searchidaction":
			action = new SearchIdAction();
			break;
		case "searchpwaction":
			action = new SearchPwAction();
			break;	
		case "emailchkaction":
			action = new EmailChkAction();
			break;
		case "memberinfo":
			action = new MemberInfo();
			break;
		case "memberinfoaction":
			action = new MemberInfoAction();
			break;
		case "signin":
			action = new SignIn();
			break;
		case "signinaction":
			action = new SignInAction();
			break;
		case "partprice":
			action = new PartPrice();
			break;
		case "recent":
			action = new Recent();
			break;
		case "review":
			action = new Review();
			break;
		case "main":
			action = new Main();
			break;
		case "sellpc":
			action = new SellPC();
			break;
		case "sellpcchat":
			action = new SellPCChat();
			break;
		case "warranty":
			action = new Warranty();
			break;
		}
		
		
			
		return action;
	}
}
