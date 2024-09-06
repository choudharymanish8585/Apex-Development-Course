String domainUrl = Url.getOrgDomainUrl().toExternalForm();
System.debug('My Domain Name using Url: ' + domainUrl);

System.debug('DomainCreator.getOrgMyDomainHostname(): ' + DomainCreator.getOrgMyDomainHostname());
System.debug('DomainCreator.getLightningHostname(): ' + DomainCreator.getLightningHostname());
System.debug('DomainCreator.getExperienceCloudSitesBuilderHostname(): ' + DomainCreator.getExperienceCloudSitesBuilderHostname());

{
    System.Domain d = DomainParser.parse('sfa-dev-training-dev-ed.lightning.force.com');
    System.debug('System.Domain getMyDomainName: ' + d.getMyDomainName());
    System.debug('System.Domain getDomainType: ' + d.getDomainType());
}

{
    System.Domain d = DomainParser.parse(DomainCreator.getOrgMyDomainHostname());
    System.debug('System.Domain getMyDomainName: ' + d.getMyDomainName());
    System.debug('System.Domain getDomainType: ' + d.getDomainType());
}

{
    System.Domain d = DomainParser.parse(DomainCreator.getLightningHostname());
    System.debug('System.Domain getMyDomainName: ' + d.getMyDomainName());
    System.debug('System.Domain getDomainType: ' + d.getDomainType());
}

{
    System.Domain d = DomainParser.parse(DomainCreator.getExperienceCloudSitesBuilderHostname());
    System.debug('System.Domain getMyDomainName: ' + d.getMyDomainName());
    System.debug('System.Domain getDomainType: ' + d.getDomainType());
}
