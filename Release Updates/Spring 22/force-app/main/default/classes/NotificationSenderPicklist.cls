public with sharing class NotificationSenderPicklist extends VisualEditor.DynamicPickList {
    public override VisualEditor.DataRow getDefaultValue() {
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('InAppNotificationSender', 'InAppNotificationSender');
        return defaultValue;
    }

    public override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows myValues = new VisualEditor.DynamicPickListRows();
        for (ApexTypeImplementor ns : [
            SELECT ClassName, ClassNamespacePrefix
            FROM ApexTypeImplementor
            WHERE InterfaceName = 'NotificationSender' AND IsConcrete = TRUE
        ]) {
            myValues.addRow(new VisualEditor.DataRow(ns.ClassName, ns.ClassName));
        }

        return myValues;
    }
}