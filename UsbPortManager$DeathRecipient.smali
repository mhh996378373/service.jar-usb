.class final Lcom/android/server/usb/UsbPortManager$DeathRecipient;
.super Ljava/lang/Object;
.source "UsbPortManager.java"

# interfaces
.implements Landroid/os/IHwBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbPortManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DeathRecipient"
.end annotation


# instance fields
.field public pw:Lcom/android/internal/util/IndentingPrintWriter;

.field final synthetic this$0:Lcom/android/server/usb/UsbPortManager;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbPortManager;Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 3

    .prologue
    .line 494
    iput-object p1, p0, Lcom/android/server/usb/UsbPortManager$DeathRecipient;->this$0:Lcom/android/server/usb/UsbPortManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 495
    iput-object p2, p0, Lcom/android/server/usb/UsbPortManager$DeathRecipient;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    .line 496
    return-void
.end method


# virtual methods
.method public serviceDied(J)V
    .registers 6

    .prologue
    .line 500
    const-wide/16 v0, 0x3e8

    cmp-long v0, p1, v0

    if-nez v0, :cond_2e

    .line 501
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$DeathRecipient;->pw:Lcom/android/internal/util/IndentingPrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Usb hal service died cookie: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v2, v0, v1}, Lcom/android/server/usb/UsbPortManager;->-wrap1(ILcom/android/internal/util/IndentingPrintWriter;Ljava/lang/String;)V

    .line 502
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$DeathRecipient;->this$0:Lcom/android/server/usb/UsbPortManager;

    invoke-static {v0}, Lcom/android/server/usb/UsbPortManager;->-get1(Lcom/android/server/usb/UsbPortManager;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 503
    :try_start_27
    iget-object v0, p0, Lcom/android/server/usb/UsbPortManager$DeathRecipient;->this$0:Lcom/android/server/usb/UsbPortManager;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/android/server/usb/UsbPortManager;->-set0(Lcom/android/server/usb/UsbPortManager;Landroid/hardware/usb/V1_0/IUsb;)Landroid/hardware/usb/V1_0/IUsb;
    :try_end_2d
    .catchall {:try_start_27 .. :try_end_2d} :catchall_2f

    monitor-exit v1

    .line 506
    :cond_2e
    return-void

    .line 502
    :catchall_2f
    move-exception v0

    monitor-exit v1

    throw v0
.end method
