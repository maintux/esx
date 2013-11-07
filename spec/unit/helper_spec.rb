require 'spec_helper'

describe "ESX host helpers" do
  subject { ESX::Host.new("address", "user", "password") }

  describe "convert_guest_id_for_vmdk" do

    # key: http://pubs.vmware.com/vsphere-50/index.jsp?topic=/com.vmware.wssdk.apiref.doc_50/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html
    # value: in vmx file
    guest_id_map =  {
      "dosGuest" => "dos",
      "win31Guest" => "win31",
      "win95Guest" => "win95",
      "win98Guest" => "win98",
      "winMeGuest" => "winme",
      "winNTGuest" => "winnt",
      "win2000ProGuest" => "win2000pro",
      "win2000ServGuest" => "win2000serv",
      "win2000AdvServGuest" => "win2000advserv",
      "winXPHomeGuest" => "winxphome",
      "winXPProGuest" => "winxppro",
      "winXPPro64Guest" => "winxppro-64",
      "winNetWebGuest" => "winnetweb",
      "winNetStandardGuest" => "winnetstandard",
      "winNetEnterpriseGuest" => "winnetenterprise",
      "winNetDatacenterGuest" => "",
      "winNetBusinessGuest" => "",
      "winNetStandard64Guest" => "winnetstandard-64",
      "winNetEnterprise64Guest" => "winnetenterprise-64",
      "winLonghornGuest" => "longhorn",
      "winLonghorn64Guest" => "longhorn-64",
      "winNetDatacenter64Guest" => "",
      "winVistaGuest" => "winvista",
      "winVista64Guest" => "winvista-64",
      "windows7Guest" => "windows7",
      "windows7_64Guest" => "windows7-64",
      "windows7Server64Guest" => "",
      "windows8Guest" => "windows8",
      "windows8_64Guest" => "windows8-64",
      "windows8Server64Guest" => "",
      "freebsdGuest" => "freebsd",
      "freebsd64Guest" => "freebsd-64",
      "redhatGuest" => "redhat",
      "rhel2Guest" => "rhel2",
      "rhel3Guest" => "rhel3",
      "rhel3_64Guest" => "rhel3-64",
      "rhel4Guest" => "rhel4",
      "rhel4_64Guest" => "rhel4-64",
      "rhel5Guest" => "rhel5",
      "rhel5_64Guest" => "rhel5-64",
      "rhel6Guest" => "rhel6",
      "rhel6_64Guest" => "rhel6-64",
      "centosGuest" => "centos",
      "centos64Guest" => "centos-64",
      "oracleLinuxGuest" => "oraclelinux",
      "oracleLinux64Guest" => "oraclelinux-64",
      "suseGuest" => "suse",
      "suse64Guest" => "suse-64",
      "slesGuest" => "sles",
      "sles64Guest" => "sles-64",
      "sles10Guest" => "sles10",
      "sles10_64Guest" => "sles10-64",
      "sles11Guest" => "sles11",
      "sles11_64Guest" => "sles11-64",
      "nld9Guest" => "nld9",
      "oesGuest" => "oes",
      "sjdsGuest" => "sjds",
      "mandrivaGuest" => "mandriva",
      "mandriva64Guest" => "mandriva-64",
      "turboLinuxGuest" => "turbolinux",
      "turboLinux64Guest" => "turbolinux-64",
      "ubuntuGuest" => "ubuntu",
      "ubuntu64Guest" => "ubuntu-64",
      "debian4Guest" => "debian4",
      "debian4_64Guest" => "debian4-64",
      "debian5Guest" => "debian5",
      "debian5_64Guest" => "debian5-64",
      "debian6Guest" => "debian6",
      "debian6_64Guest" => "debian6-64",
      "asianux3Guest" => "asianux3",
      "asianux3_64Guest" => "asianux3-64",
      "asianux4Guest" => "asianux4",
      "asianux4_64Guest" => "asianux4-64",
      "other24xLinuxGuest" => "other24xlinux",
      "other26xLinuxGuest" => "other26xlinux",
      "otherLinuxGuest" => "otherlinux",
      "other24xLinux64Guest" => "other24xlinux-64",
      "other26xLinux64Guest" => "other26xlinux-64",
      "otherLinux64Guest" => "otherlinux-64",
      "solaris6Guest" => "",
      "solaris7Guest" => "",
      "solaris8Guest" => "solaris8",
      "solaris9Guest" => "solaris9",
      "solaris10Guest" => "solaris10",
      "solaris10_64Guest" => "solaris10-64",
      "solaris11_64Guest" => "solaris11-64",
      "os2Guest" => "os2",
      "eComStationGuest" => "ecomstation",
      "eComStation2Guest" => "ecomstation2",
      "netware4Guest" => "",
      "netware5Guest" => "netware5",
      "netware6Guest" => "netware6",
      "openServer5Guest" => "",
      "openServer6Guest" => "",
      "unixWare7Guest" => "",
      "darwinGuest" => "darwin",
      "darwin64Guest" => "darwin-64",
      "darwin10Guest" => "darwin10",
      "darwin10_64Guest" => "darwin10-64",
      "darwin11Guest" => "darwin11",
      "darwin11_64Guest" => "darwin11-64",
      "vmkernelGuest" => "vmkernel",
      "vmkernel5Guest" => "vmkernel5",
      "otherGuest" => "other",
      "otherGuest64" => "other-64",
    }

    guest_id_map.each do |api_value, vmx_value|
      if vmx_value.empty?
        it "should convert #{api_value} to vmx guestOS value"
      else
        it "should convert #{api_value} to #{vmx_value}" do
          subject.send(:convert_guest_id_for_vmdk, api_value).should == vmx_value
        end
      end
    end
    
  end
end