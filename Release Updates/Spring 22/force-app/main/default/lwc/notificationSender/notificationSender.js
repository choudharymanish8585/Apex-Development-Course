import send from '@salesforce/apex/NotificationSenderController.send';
import { LightningElement, api } from 'lwc';

export default class NotificationSender extends LightningElement {
    @api notificationType = '';
    msg;
    receipent;

    handleReceipentChange(event){
        this.receipent = event.detail.value;
    }

    handleMessageChange(event){
        this.msg = event.detail.value;
    }

    async handleClick(){
        await send({type: this.notificationType, msg: this.msg, receipent: this.receipent});
    }
}