.class Lcom/android/server/usb/UsbPortManager$1;
.super Landroid/os/Handler;
.source "UsbPortManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbPortManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/usb/UsbPortManager;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbPortManager;Landroid/os/Looper;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager$1;->this$0:Lcom/android/server/usb/UsbPortManager;

    .line 712
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 6

    .prologue
    .line 715
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_24

    .line 725
    :goto_5
    return-void

    .line 717
    :pswitch_6  #0x1
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 718
    const-string/jumbo v1, "port_info"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 719
    iget-object v1, p0, Lcom/android/server/usb/UsbPortManager$1;->this$0:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v1}, Lcom/android/server/usb/UsbPortManager;->-get1(Lcom/android/server/usb/UsbPortManager;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 720
    :try_start_18
    iget-object v2, p0, Lcom/android/server/usb/UsbPortManager$1;->this$0:Lcom/android/server/usb/UsbPortManager;

    const/4 v3, 0x0

    invoke-static {v2, v3, v0}, Lcom/android/server/usb/UsbPortManager;->-wrap2(Lcom/android/server/usb/UsbPortManager;Lcom/android/internal/util/IndentingPrintWriter;Ljava/util/ArrayList;)V
    :try_end_1e
    .catchall {:try_start_18 .. :try_end_1e} :catchall_20

    monitor-exit v1

    goto :goto_5

    .line 719
    :catchall_20
    move-exception v0

    monitor-exit v1

    throw v0

    .line 715
    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_6  #00000001
    .end packed-switch
.end method
