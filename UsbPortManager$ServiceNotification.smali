.class final Lcom/android/server/usb/UsbPortManager$ServiceNotification;
.super Landroid/hidl/manager/V1_0/IServiceNotification$Stub;
.source "UsbPortManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbPortManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ServiceNotification"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/usb/UsbPortManager;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbPortManager;)V
    .registers 2

    .prologue
    .line 509
    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager$ServiceNotification;->this$0:Lcom/android/server/usb/UsbPortManager;

    invoke-direct {p0}, Landroid/hidl/manager/V1_0/IServiceNotification$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onRegistration(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 512
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Usb hal service started "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v1, v2, v0}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 513
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$ServiceNotification;->this$0:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v0, v2}, Lcom/android/server/usb/UsbPortManager;->-wrap0(Lcom/android/server/usb/UsbPortManager;Lcom/android/internal/util/IndentingPrintWriter;)V

    .line 514
    return-void
.end method
