.class public Lcom/android/server/usb/UsbService$Lifecycle;
.super Lcom/android/server/SystemService;
.source "UsbService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Lifecycle"
.end annotation


# instance fields
.field private mUsbService:Lcom/android/server/usb/UsbService;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/android/server/SystemService;-><init>(Landroid/content/Context;)V

    .line 64
    return-void
.end method


# virtual methods
.method public onBootPhase(I)V
    .registers 3

    .prologue
    .line 74
    const/16 v0, 0x226

    if-ne p1, v0, :cond_a

    .line 75
    iget-object v0, p0, Lcom/android/server/usb/UsbService$Lifecycle;->mUsbService:Lcom/android/server/usb/UsbService;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbService;->systemReady()V

    .line 79
    :cond_9
    :goto_9
    return-void

    .line 76
    :cond_a
    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_9

    .line 77
    iget-object v0, p0, Lcom/android/server/usb/UsbService$Lifecycle;->mUsbService:Lcom/android/server/usb/UsbService;

    invoke-virtual {v0}, Lcom/android/server/usb/UsbService;->bootCompleted()V

    goto :goto_9
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 68
    new-instance v0, Lcom/android/server/usb/UsbService;

    invoke-virtual {p0}, Lcom/android/server/usb/UsbService$Lifecycle;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbService$Lifecycle;->mUsbService:Lcom/android/server/usb/UsbService;

    .line 69
    const-string/jumbo v0, "usb"

    iget-object v1, p0, Lcom/android/server/usb/UsbService$Lifecycle;->mUsbService:Lcom/android/server/usb/UsbService;

    invoke-virtual {p0, v0, v1}, Lcom/android/server/usb/UsbService$Lifecycle;->publishBinderService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 70
    return-void
.end method

.method public onStopUser(I)V
    .registers 4

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/server/usb/UsbService$Lifecycle;->mUsbService:Lcom/android/server/usb/UsbService;

    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/server/usb/UsbService;->-wrap0(Lcom/android/server/usb/UsbService;Landroid/os/UserHandle;)V

    .line 89
    return-void
.end method

.method public onSwitchUser(I)V
    .registers 3

    .prologue
    .line 83
    iget-object v0, p0, Lcom/android/server/usb/UsbService$Lifecycle;->mUsbService:Lcom/android/server/usb/UsbService;

    invoke-static {v0, p1}, Lcom/android/server/usb/UsbService;->-wrap1(Lcom/android/server/usb/UsbService;I)V

    .line 84
    return-void
.end method
