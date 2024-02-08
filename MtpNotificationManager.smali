.class Lcom/android/server/usb/MtpNotificationManager;
.super Ljava/lang/Object;
.source "MtpNotificationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/MtpNotificationManager$OnOpenInAppListener;,
        Lcom/android/server/usb/MtpNotificationManager$Receiver;
    }
.end annotation


# static fields
.field private static final ACTION_OPEN_IN_APPS:Ljava/lang/String; = "com.android.server.usb.ACTION_OPEN_IN_APPS"

.field private static final PROTOCOL_MTP:I = 0x0

.field private static final PROTOCOL_PTP:I = 0x1

.field private static final SUBCLASS_MTP:I = 0xff

.field private static final SUBCLASS_STILL_IMAGE_CAPTURE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "UsbMtpNotificationManager"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mListener:Lcom/android/server/usb/MtpNotificationManager$OnOpenInAppListener;


# direct methods
.method static synthetic -get0(Lcom/android/server/usb/MtpNotificationManager;)Lcom/android/server/usb/MtpNotificationManager$OnOpenInAppListener;
    .registers 2

    iget-object v0, p0, Lcom/android/server/usb/MtpNotificationManager;->mListener:Lcom/android/server/usb/MtpNotificationManager$OnOpenInAppListener;

    return-object v0
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/server/usb/MtpNotificationManager$OnOpenInAppListener;)V
    .registers 6

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/android/server/usb/MtpNotificationManager;->mContext:Landroid/content/Context;

    .line 70
    iput-object p2, p0, Lcom/android/server/usb/MtpNotificationManager;->mListener:Lcom/android/server/usb/MtpNotificationManager$OnOpenInAppListener;

    .line 71
    new-instance v0, Lcom/android/server/usb/MtpNotificationManager$Receiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/server/usb/MtpNotificationManager$Receiver;-><init>(Lcom/android/server/usb/MtpNotificationManager;Lcom/android/server/usb/MtpNotificationManager$Receiver;)V

    .line 72
    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "com.android.server.usb.ACTION_OPEN_IN_APPS"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 73
    return-void
.end method

.method private static isMtpDevice(Landroid/hardware/usb/UsbDevice;)Z
    .registers 8

    .prologue
    const/16 v6, 0xff

    const/4 v1, 0x0

    const/4 v5, 0x1

    move v0, v1

    .line 137
    :goto_5
    invoke-virtual {p0}, Landroid/hardware/usb/UsbDevice;->getInterfaceCount()I

    move-result v2

    if-ge v0, v2, :cond_46

    .line 138
    invoke-virtual {p0, v0}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v2

    .line 139
    invoke-virtual {v2}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v3

    const/4 v4, 0x6

    if-ne v3, v4, :cond_23

    .line 140
    invoke-virtual {v2}, Landroid/hardware/usb/UsbInterface;->getInterfaceSubclass()I

    move-result v3

    if-ne v3, v5, :cond_23

    .line 141
    invoke-virtual {v2}, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I

    move-result v3

    if-ne v3, v5, :cond_23

    .line 142
    return v5

    .line 144
    :cond_23
    invoke-virtual {v2}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v3

    if-ne v3, v6, :cond_43

    .line 145
    invoke-virtual {v2}, Landroid/hardware/usb/UsbInterface;->getInterfaceSubclass()I

    move-result v3

    if-ne v3, v6, :cond_43

    .line 146
    invoke-virtual {v2}, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I

    move-result v3

    if-nez v3, :cond_43

    .line 147
    const-string/jumbo v3, "MTP"

    invoke-virtual {v2}, Landroid/hardware/usb/UsbInterface;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 144
    if-eqz v2, :cond_43

    .line 148
    return v5

    .line 137
    :cond_43
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 151
    :cond_46
    return v1
.end method

.method static shouldShowNotification(Landroid/content/pm/PackageManager;Landroid/hardware/usb/UsbDevice;)Z
    .registers 3

    .prologue
    .line 132
    const-string/jumbo v0, "android.hardware.type.automotive"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 133
    invoke-static {p1}, Lcom/android/server/usb/MtpNotificationManager;->isMtpDevice(Landroid/hardware/usb/UsbDevice;)Z

    move-result v0

    .line 132
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method hideNotification(I)V
    .registers 5

    .prologue
    .line 110
    iget-object v0, p0, Lcom/android/server/usb/MtpNotificationManager;->mContext:Landroid/content/Context;

    const-class v1, Landroid/app/NotificationManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 111
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x19

    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    .line 112
    return-void
.end method

.method showNotification(Landroid/hardware/usb/UsbDevice;)V
    .registers 8

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/server/usb/MtpNotificationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 77
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 79
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 78
    const v2, 0x1040607

    .line 77
    invoke-virtual {v0, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 81
    const v2, 0x1040606

    .line 80
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 83
    new-instance v2, Landroid/app/Notification$Builder;

    iget-object v3, p0, Lcom/android/server/usb/MtpNotificationManager;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/android/internal/notification/SystemNotificationChannels;->USB:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 86
    const v1, 0x10807a4

    .line 83
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 87
    const-string/jumbo v1, "sys"

    .line 83
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 89
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.android.server.usb.ACTION_OPEN_IN_APPS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 90
    const-string/jumbo v2, "device"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 91
    const/high16 v2, 0x50000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 94
    iget-object v2, p0, Lcom/android/server/usb/MtpNotificationManager;->mContext:Landroid/content/Context;

    .line 95
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceId()I

    move-result v3

    .line 98
    sget-object v4, Landroid/os/UserHandle;->SYSTEM:Landroid/os/UserHandle;

    .line 97
    const/high16 v5, 0x8000000

    .line 93
    invoke-static {v2, v3, v1, v5, v4}, Landroid/app/PendingIntent;->getBroadcastAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 101
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    .line 102
    iget v0, v1, Landroid/app/Notification;->flags:I

    or-int/lit16 v0, v0, 0x100

    iput v0, v1, Landroid/app/Notification;->flags:I

    .line 104
    iget-object v0, p0, Lcom/android/server/usb/MtpNotificationManager;->mContext:Landroid/content/Context;

    const-class v2, Landroid/app/NotificationManager;

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 105
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x19

    .line 104
    invoke-virtual {v0, v2, v3, v1}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 107
    return-void
.end method
