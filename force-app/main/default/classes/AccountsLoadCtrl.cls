public with sharing class AccountsLoadCtrl {
   	
   	private static Set<Id> accsIds;
   	private static Set<Id> ids;

    public AccountsLoadCtrl() {}

    static {
		accsIds = new Set<Id>();
		for (Account a : [select id from account])
			accsIds.add(a.id);
	}

    @RemoteAction
	public static List<Account> getAccounts() {
		return [
		           Select Id,
		           Name,
		           Phone,
		           Type,
		           CreatedDate,
		           Owner.Name
		           From Account
		           where id in: accsIds
		       ];
	}
}